
#
# div.bike-grp.clear.product-grid
# div.block-title-banner


# pulls the category
# div#wrapper --> h1.bolt-header => all the category text
# data.css('div#wrapper').css('h1.bolt-header').each {|x| puts x.text}




#pulls the bike names
# section = data.css('div#wrapper')
# section.css('div.bike-grp.clear.product-grid').css('div.block-title-banner').each{|x| puts x.text}

# creates an array of hashes by category
# section.css('h1.bolt-header').collect {|x| bike_hash[:"#{x.text}"] = {}}
# => {:Pavement=>{}, :Touring=>{}, :Haulin’=>{}, :Trail=>{}}


# section.css('h1.bolt-header').collect do |x|
# 	bike_hash[:"#{x.text}"] = {}

	#find the bike models

# end


# the below specifically calls the bike model name
# data.css('.block-title-banner').collect{|x| x.text}





# collection of bike models
# data.css('div a').collect {|x| x.css('div.block-title-banner').text}
# => ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "Midnight Special", "Cross-Check", "Steamroller", "Flat Bar Cross-Check", "Straggler", "Straggler 650b", "Pacer", "Travelers Check", "Bridge Club", "Pugsley", "Pack Rat", "Long Haul Trucker", "Disc Trucker", "Ogre", "Troll", "ECR 29+", "ECR 27+", "Big Fat Dummy", "Big Dummy", "Bill Trailer", "Ted Trailer", "Ice Cream Truck", "Wednesday", "Krampus", "Karate Monkey SS", "Karate Monkey 27.5+", "Instigator 2.0", ""]


#page
#
# bike-grp clear product-grid
#
# span-6 bike-block left
#
# block-title-banner
#
#
#
#
#
# section = data.css('#page')
# section = data.css('.bike-grp.clear.product-grid')
# bike = section.css('.span-6.bike-block.left')
# bike.css('a').attribute('href').text => URL
# bike.css('.block-title-banner').text => bike model
#
#
#
#
# data.css('div div a').each {|x| puts x.attribute('href').text} => ALL URLs
# data.css('div div.span-6.bike-block.left a').each {|x| puts x.attribute('href').text} ==> only bike links
#
#
#
# data.css('#page h1.bolt-header').collect {|x| x.text} => category
#
# data.css('h1.bolt-header').collect{|x| x.text} => category
#
#
#
# makes an array of hashes for each categroy
# data.css('#page h1.bolt-header').collect do |section|
# {section.text.to_sym => "Url"}
# end
==========================================================================================
==========================================================================================
==========================================================================================

grabs the tab text
data.css('li.nav-item a').collect {|x| x.text}

grabs the url of the nav-bar
data.css('li.nav-item a').collect {|x| x.attribute('href').text}

name of bike in specific bike page
Nokogiri::HTML(open('https://surlybikes.com/bikes/midnight_special')).css('h1').text

==========================================================================================
==========================================================================================
==========================================================================================

Array of hashes

data.css('div#info-nav.desktop a').collect{|x| {x.text.downcase.split(" ").join("_").to_sym => url + "/" + x.attribute('href').text}}

Array of bike hashes

data.css('div#info-nav.desktop a').collect{|x| {x.text.to_sym => "URL" + "/" + x.attribute('href').text}}


=> [{:Info=>"URL/bike_info"}, {:"Complete Bike Parts Kit"=>"URL/bike_specs"}, {:Geometry=>"URL/geometry"}, {:"Frame Highlights"=>"URL/frame_highlights"}]


nested array of nav text and nav links

data.css('div#info-nav.desktop a').collect {|x| [x.attribute('href').text.to_sym, url + "/" + x.attribute('href').text]}



=> [[:bike_info, "https://surlybikes.com/bikes/midnight_special/bike_info"], [:bike_specs, "https://surlybikes.com/bikes/midnight_special/bike_specs"], [:geometry, "https://surlybikes.com/bikes/midnight_special/geometry"], [:frame_highlights, "https://surlybikes.com/bikes/midnight_special/frame_highlights"]]


data.css('div#info-nav.desktop a').collect {|x| [x.attribute('href').text.to_sym, url + "/" + x.attribute('href').text]}.to_h



https://surlybikes.com/bikes/midnight_special/bike_specs



#bike-build-specs .left strong



specs.css('#bike-build-specs .left strong').each{|x| puts x.text}

specs.css('#bike-build-specs .last').each {|x| puts x.text}



specs.css('div#bike-build-specs .left strong').collect {|x| x.text}




data.css('div.span-7.first.left').each{|x| puts x.text}




data.css('div#bike-build-specs.span-17').each{|x| puts x.css('div').text}




section = data.css('div#bike-build-specs.span-17')

section.css('div .left').collect {|x| x.text}




arr = section.css('div .left').collect {|x| x.text}
