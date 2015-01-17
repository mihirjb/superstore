desc "Get the various phones"
task :add_phone_data => :environment do

  require "nokogiri"
  require "open-uri"


  url = "http://swappa.com/devices/all/us"
  doc = Nokogiri::HTML(open(url))
  ul = doc.css('.dev_cell_wide')
   ul.each do |t|
    modelname =  t.css('.title a').text.strip
    company = modelname.split(" ").first
    phonetype = "phone"
     @phone = Phone.create(:modelname => modelname, :company => company, :phonetype => phonetype)
  end
end
