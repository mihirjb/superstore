desc "Add 100 listings to each phone"
task :add_dummy_data => :environment do
 
 
 @phones = Phone.all
 @phones.each do |p|
  1.upto(5) do |i|
   Listing.create(:headline => "Listing no. #{i}", :description => "This is a dummy description for listing no. #{i}", :devicecondition => "Mint", :askprice => 200, :accessories => "Original", :devicecolor => "black", :devicestorage => "16gb", :itemlocation =>"Boston", :paypalemail => "mihirjb@gmail.com", :devicename => "#{p.modelname}", :devicecarrier => "#{p.carrier}", :vendor_id => 1, :deviceimei => "321456783429932", :status => "Approved",:paypalstatus => "Verified", :phone_id => p.id )
end
end


end