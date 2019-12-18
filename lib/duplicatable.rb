module Duplicatable
  
  def duplicate(*parent)
    new_duplicatable = self.dup
    new_duplicatable.name = find_name(self.name) if self.has_attribute? :name
    new_duplicatable.set_parent(parent[0]) unless parent.blank?
    # not really the right place for that, should be overriding dup inside level.rb
    new_duplicatable.level_index = nil if defined? new_duplicatable.level_index
    new_duplicatable.save
    self.duplicate_children(new_duplicatable) if self.respond_to? "duplicate_children"
    new_duplicatable
  end
  
  def set_parent(parent)
    parent_type = parent.class.name.downcase
    self.send "#{parent_type}=", parent
  end

  protected
  
  def find_name(base_name)
    find_name_rec base_name.gsub(/\sv\d*$/, ""), 1
  end
  
  def find_name_rec(base_name, index)
    new_name = "#{self.name} v#{index}"
    if self.class.find_by_name(new_name).blank?
      new_name
    else
      self.find_name_rec base_name, index+1
    end
  end

end
