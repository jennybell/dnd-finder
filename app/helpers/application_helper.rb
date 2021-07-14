module ApplicationHelper
  def avatar_for(user)
    if user.avatar.attached?
      user.avatar
    else
      'default_avatar.jpg'
    end
  end
end
