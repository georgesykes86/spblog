module UsersHelper

  def gravatar_for(user, options = { size: 80 })
    email = user.email.downcase
    digested_email = Digest::MD5::hexdigest(email)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{digested_email}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end
end
