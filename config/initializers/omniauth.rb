Rails.application.config.middleware.use OmniAuth::Builder do
  provider :foursquare, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end