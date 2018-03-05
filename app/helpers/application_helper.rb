module ApplicationHelper
  def top_nav_list_item(type)
    cls = request.path =~ /#{type}/ ? 'active' : ''
    content_tag :li, class: cls do
      link_to type.pluralize.titleize, send("#{type.pluralize}_path")
    end
  end

  def select_options_for_school
    School.all.collect { |s| [s.title, s.id] }
  end

  def select_options_for_grade
    Grade.all.collect { |g| [g.title, g.id] }
  end

  def select_options_for_program
    Program.all.collect { |p| [p.title, p.id] }
  end
end
