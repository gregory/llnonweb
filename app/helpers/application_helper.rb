module ApplicationHelper
  def avatar_url(user, size=48)     
    if !user.profile.nil? and user.profile.avatar_url.nil?
      user.profile.avatar_url
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase )
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    end
    
  end
end
