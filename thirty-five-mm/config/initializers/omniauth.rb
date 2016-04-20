if Rails.env == "production"
  # no production app yet
else
  if ENV['USER'] == 'monica'
    Rails.application.config.middleware.use OmniAuth::Builder do
      # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
      provider :facebook, ENV["APP_ID"], ENV["FACEBOOK_API"]  # Find these values on the Facebook App page
    end
  end
end
