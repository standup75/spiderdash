class Bonu < ActiveRecord::Base
  extend FriendlyId
  include Duplicatable
  include WithOptions

  def as_json(options = {})
    {
      :name => self.family,
      :options => make_options,
      :x => options[:x],
      :y => options[:y]
    }
  end
end