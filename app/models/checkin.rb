class Checkin
  def get_checkins(user)
    first_250_url = "https://api.foursquare.com/v2/users/self/checkins?offset=0&limit=250&oauth_token=#{user.foursquare_token}&v=20140418"
    response = JSON.parse(Faraday.get(first_250_url).body)
    response['response']['checkins']['items'].map do |checkin|
      checkin_hash(checkin)
    end
  end

  def checkin_hash(checkin)
    h = {}
    date = checkin['createdAt']
    if checkin['venue']['categories'][0]
      h[:icon] = checkin['venue']['categories'][0]['icon']['prefix'] + '64' + checkin['venue']['categories'][0]['icon']['suffix']
    else
      h[:icon] = 'http://openclipart.org/image/2400px/svg_to_png/177854/1367934593.png'
    end
    h[:day] = Time.at(date).to_datetime.strftime('%-d').to_i
    h[:month] = Time.at(date).to_datetime.strftime('%B')
    h[:year] = Time.at(date).to_datetime.strftime('%Y').to_i
    h[:time] = Time.at(date).to_datetime.strftime('%l:%M%p')
    h[:venue] = checkin['venue']['name']
    h[:address] = checkin['venue']['location']['formattedAddress'][0] && checkin['venue']['location']['formattedAddress'][1] ? checkin['venue']['location']['formattedAddress'][0] + " " + checkin['venue']['location']['formattedAddress'][1] : "No Address on Record"
    h[:latitude] = checkin['venue']['location']['lat']
    h[:longitude] = checkin['venue']['location']['lng']
    h[:url] = checkin['venue']['url']
    h
  end
end