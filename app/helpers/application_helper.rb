module ApplicationHelper
  def link_or_span(*args)
    link = link_to_unless_current(*args) do |link|
      "<span class=\"current\">#{link}</span>".html_safe
    end
    if link.match(/\A<a/) and request.fullpath.match(*args[0].downcase)
      link.gsub!(/<a\s/, "<a class='current' ")
    end
    link.html_safe
  end

  def level_name(level)
    name = [level.name]
    if level.level_index
      name << level.level_index
    elsif level.checkpoint and level.checkpoint.kind == CHECKPOINT_BONUS_LEVEL
      name << "secret"
    end
    name.join " - "
  end
end
