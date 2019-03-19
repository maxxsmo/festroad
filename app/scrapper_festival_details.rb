require 'open-uri'
require 'nokogiri'
require 'json'


# lets get the array_links (in scrapper_allfestivals_url.rb) where we stocked the festivals urls for each page_fest_details.
#lets scrap (title address start_date end_date music_type)
array_links.each do |y|
  Nokogiri::HTML(open('y'))
end

#page_fest_details = Nokogiri::HTML(open('https://www.festicket.com/fr/festivals/main-square-festival/2019/'))

def get_festival_title(page_fest_details)
  fest_title = page_fest.css('h1')
  puts fest_title.text
end
get_festival_title(page_fest_details)

def get_festival_address(page_fest_details)
  fest_address = page_fest.xpath('//*[@id="root"]/main/div[1]/div[1]/div/div[1]/div[2]/ul[1]/li[1]/text()')
  puts fest_address.text
end
get_festival_address(page_fest_details)

def get_festival_dates(page_fest_details)
  fest_dates = page_fest.xpath('//*[@id="root"]/main/div[1]/div[1]/div/div[1]/div[2]/ul[1]/li[2]')
  puts fest_dates.text
end
get_festival_dates(page_fest_details)

def get_festival_music_type(page_fest_details)
  fest_music_type = page_fest.xpath('//*[@id="root"]/main/div[1]/div[1]/div/div[1]/div[2]/ul[2]/li')
  puts fest_music_type.text
end
get_festival_music_type(page_fest_details)



# page of the festival to scrap the price:
page_fest_price = Nokogiri::HTML(open('https://www.festicket.com/fr/festivals/solidays/2019/shop/?feature_packagesVariant=c')

https://www.festicket.com/fr/festivals/solidays/2019/shop/?feature_packagesVariant=c
https://www.festicket.com/fr/festivals/garorock/2019/shop/?feature_packagesVariant=c
def get_festival_price(page_fest)
  fest_price = page_fest.xpath('//*/div[2]/h3')
  puts fest_price.text
end
get_festival_price(page_fest)