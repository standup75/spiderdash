class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  paginates_per 50
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :game_progress
  belongs_to :role
  before_create :check_role
  
  validates_uniqueness_of :email
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "Invalid email", :allow_nil => true
  validates_length_of :password, :within => 4..12, :on => :create

  def self.random_string(len)
    #generate a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

  def as_json(options = {})
    {
      :gameProgress => self.game_progress,
      :highscore => self.highscore,
      :email => self.email,
      :id => self.id
    }
  end

  def method_missing(method_id, *args)
    if match = matches_dynamic_role_check?(method_id)
      tokenize_roles(match.captures.first).each do |check|
        return true if self.role.name.downcase == check or self.role.name.downcase == "admin"
      end
      return false
    else
      super
    end
  end
 
  private
 
  def matches_dynamic_role_check?(method_id)
    /\Ais_([a-zA-Z]\w*)\?\z/.match(method_id.to_s)
  end
 
  def tokenize_roles(string_to_split)
    string_to_split.split(/_or_/)
  end

  def check_role
    unless role_id
      self.role = Role.where(:name => "player").first
    end
  end

end