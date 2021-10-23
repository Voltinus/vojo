module ApplicationHelper
  def path_for_user_profile(user)
    '/' + locale.to_s + '/users/' + user.id.to_s
  end
end
