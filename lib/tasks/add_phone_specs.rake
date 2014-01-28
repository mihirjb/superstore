desc "Get the various phones"
task :add_phone_specs => :environment do

  require "nokogiri"
  require "open-uri"
  require "mechanize"


  url = "http://swappa.com/devices/all/us"
  doc = Nokogiri::HTML(open(url))
  ul = doc.css('.dev_grid ul li')
   ul.each do |t|
      modelname =  t.css('.dev_cell .title a').text
      @phone = Phone.find_by_modelname(modelname)
    newurl =  t.css('.dev_cell .title a')[0]['href']
    newurl = "http://swappa.com" + newurl
    
    nextpage =  Nokogiri::HTML(open(newurl))
    
   
    targetpageurl = nextpage.css('#main_row_span4 table tr td a')[0]['href']
    targetpageurl = "http://swappa.com" + targetpageurl

    
    
    targetpage = Nokogiri::HTML(open(targetpageurl))
    
    rows = targetpage.css('table:eq(1) tr')
     rows.each do |r|
       if r.css('td.label').text.downcase == "manufacturer"
         @manufacturer = r.css('td:eq(2) span').text
       end
       if r.css('td.label').text.downcase == "providers"
          @providers = r.css('td:eq(2)').text
        end
        if r.css('td.label').text.downcase == "speed"
           @speed = r.css('td:eq(2)').text.strip
         end
          if r.css('td.label').text.downcase == "resolution"
              @resolution = r.css('td:eq(2)').text.strip
            end
             if r.css('td.label').text.downcase == "memory ram"
                  @ram = r.css('td:eq(2)').text.strip
                end  
                 if r.css('td.label').text.downcase == "micro sd"
                      @microsd = r.css('td:eq(2)').text.strip
                    end
                     if r.css('td.label').text.downcase == "resolution"
                          @resolution = r.css('td:eq(2)').text.strip
                        end    
                        if r.css('td.label').text.downcase == "display size"
                              @displaysize = r.css('td:eq(2)').text.strip
                            end   
                            if r.css('td.label').text.downcase == "features"
                                  @microsd = r.css('td:eq(2)').text.strip
                                end 
            
         if r.css('td.label').text.downcase == "available colors"
            cl = r.css('td:eq(2) ul li')
            @color = ""
            cl.each do  |c|
            @color =  @color + " " + c.text
           @color =  @color.strip
          end
          end
          
    
    
  end

 
    @specs = Specification.create(:phone_id => @phone.id, :manufacturer => @manufacturer, :providers => @providers, :speed => @speed, :resolution  => @resolution, :color => @color,)
    if @specs.save
      puts "Saved"
   end
   
  end
end
