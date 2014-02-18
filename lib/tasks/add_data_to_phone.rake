desc "Get the various phones"
task :add_phone_data => :environment do

  require "nokogiri"
  require "open-uri"


  url = "http://swappa.com/devices/all/us"
  doc = Nokogiri::HTML(open(url))
  ul = doc.css('.dev_cell_wide')
   ul.each do |t|
     country = "United States"
    modelname =  t.css('.title a').text.strip
    carrier = t.css('.subtitle a').text.strip
     @phone = Phone.create(:modelname => modelname, :carrier => carrier, :market => country)
  end
end
