module WithOptions
  def self.included(base)
    base.class_eval do
      has_many :options
      friendly_id :name, use: :slugged
      attr_accessible :name, :options, :family, :set
      validates_presence_of :name, :family, :set
      scope :set, lambda { |set|
        where :set => set
      }
    end
  end

  def duplicate_children(new_sprite)
    self.options.each do |option|
      option.duplicate new_sprite
    end
  end

  def options_as_string
    options_string = []
    self.options.each do |option|
      options_string << "#{option.label}:#{option.content}"
    end
    options_string.join " | "
  end

  def make_options(level_id = nil)
    opt = {}
    if defined?(self.options) and not self.options.blank?
      self.options.each do |option|
        if option.level_id == nil
          opt[option.label] = is_number?(option.content) ? option.content.to_f : option.content
        end
      end
      self.options.each do |option|
        if option.level_id == level_id
          opt[option.label] = is_number?(option.content) ? option.content.to_f : option.content
        end
      end
    end
    opt
  end

  private
  
  def is_number?(str)
    true if Float(str) rescue false
  end
end