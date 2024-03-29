module UsersHelper
  #returns the gravatar according to the user's email
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    return  image_tag(gravatar_url, alt: user.name, class:"gravatar")
  end
end
