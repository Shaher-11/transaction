module GroupsHelper
  def display_groups(name, groups)
    render partial: name, locals: { obj: groups } if groups
  end

  def display_group_image(group)
    "<div class='col-sm-2'> #{image_tag(group.image, class: 'group-img')}</div>".html_safe if group.image.attached?
  end
end
