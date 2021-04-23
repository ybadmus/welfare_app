module WelfareHelper
  def nav_title
    if params[:external]
      raw("<h1 class='nav-title'>External welfares</h1>")
    else
      raw("<h1 class='nav-title'>Welfares</h1>")
    end
  end

  def total_amount(welfares)
    raw("<p class='main-tracker'>
      Total amount collected: <strong>#{welfares.total_amount}</strong>
      </p>")
  end

  def welfare_icon(welfare)
    group = welfare.groups.first

    if group.nil?
      #image_tag(exercise.user.icon, class: 'item-icon')
    else
      link_to image_tag(group.Icon), group_path(group.id), class: 'item-icon'
    end
  end

  def welfare_amount(welfare)
    raw("<strong> #{welfare.amount.nil? ? '' : "GHS #{welfare.amount}"} </strong>")
  end
end