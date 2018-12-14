module UsersHelper

  # returns the gravitar for a given user
  def gravitar_for(user)
    gravitar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravitar_url = "https://secure.gravatar.com/avatar/#{gravitar_id}"
    image_tag(gravitar_url, alt: user.name, class: "gravitar")
  end
end
