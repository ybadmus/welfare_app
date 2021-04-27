module ContributorHelper
  def contributor_icon(contributor)
    if contributor.icon.empty?
      image_tag(current_user.icon, class: 'item-icon')
    else
      link_to image_tag(contributor.icon), contributor_path(contributor.id)
    end
  end
end
