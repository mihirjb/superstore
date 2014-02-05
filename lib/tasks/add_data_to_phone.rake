desc "Get the various phones"
task :add_phone_data => :environment do

  require "nokogiri"
  require "open-uri"


  url = "http://swappa.com/devices/all/us"
  doc = Nokogiri::HTML(open(url))
  ul = doc.css('.dev_grid ul li')
   ul.each do |t|
    modelname =  t.css('.dev_cell .title a').text
    carrier = t.css('.subtitle a').text
     @phone = Phone.create(:modelname => modelname, :carrier => carrier)
  end
end
