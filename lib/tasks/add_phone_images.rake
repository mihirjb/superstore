desc "Get the  phone pictures"
task :add_phone_images => :environment do

  require "nokogiri"
  require "open-uri"
  require "mechanize"

@phone = Phone.all

    agent = Mechanize.new 
    
    @phone.each do |p|
      
      puts p.modelname 
      if p.carrier == "AT&T"
        p.carrier = "att"
      end
        if p.carrier == "T-Mobile"
          p.carrier = "tmobile"
        end
         if p.carrier == "Wi-Fi"
            p.carrier = "wifi"
          end
         if p.modelname ==  "Samsung Galaxy Note II"
p.modelname =  "Samsung Galaxy Note 2"
      end
      if p.modelname ==  "Droid DNA"
       p.modelname =  "HTC Droid DNA"
     end
     
     if p.modelname ==  "Droid Razr Maxx HD"
      p.modelname =  "Motorola Droid Razr Maxx HD"
    end
        
      
      if p.modelname == "Galaxy Nexus"
        p.modelname = "Samsung Galaxy Nexus"
      end
    @phonename = p.modelname.gsub!(" ","-").downcase + "-" + p.carrier.downcase
      puts @phonename
      
      


        url = "http://swappa.com/buy/#{@phonename}/us"
         if url ==  "http://swappa.com/buy/nexus-7-2012-wifi/us"
           url = "http://swappa.com/buy/nexus-7-wifi"
        end
         if url ==  "http://swappa.com/buy/asus-eee-pad-transformer-tf700-wifi/us"
           url = "http://swappa.com/buy/asus-eee-pad-transformer-tf101"
        end
        
    
    
    page = agent.get(url)
    images = page.search("#main_row_span4 img")
    imgurl = images.first.attributes["src"].text
    imgurl = imgurl.sub! "http://swappa.s3.amazonaws.com/images/dynamic/", ""
    imgurlname = imgurl.sub! ".png", ""
    agent.get(images.first.attributes["src"]).save "/Users/mihirbuch/Desktop/newphoneimages/#{p.modelname}.png"
end
end
