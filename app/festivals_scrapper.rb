require 'open-uri'
require 'nokogiri'
require 'json'

#page list of festivals (title address start_date end_date price music_type)
page_all_festivals = Nokogiri::HTML(open('https://www.festicket.com/fr/festivals/?country=FR'))

def get_festivals_url(page_all_festivals)
  all_festivals_url = page_all_festivals.css('a.sc-htpNat .dGjrHs')
  # all_festivals_url = page_all_festivals.xpath('//*/div/div/div[1]/div/a[0]')
  puts all_festivals_url.text
end
get_festivals_url(page_all_festivals)


page_fest = Nokogiri::HTML(open('https://www.festicket.com/fr/festivals/main-square-festival/2019/'))

# def get_festival_title(page_fest)
#   fest_title = page_fest.css('h1')
#   puts fest_title.text
# end
# get_festival_title(page_fest)

# def get_festival_address(page_fest)
#   fest_address = page_fest.xpath('//*[@id="root"]/main/div[1]/div[1]/div/div[1]/div[2]/ul[1]/li[1]/text()')
#   puts fest_address.text
# end
# get_festival_address(page_fest)

# def get_festival_dates(page_fest)
#   fest_dates = page_fest.xpath('//*[@id="root"]/main/div[1]/div[1]/div/div[1]/div[2]/ul[1]/li[2]')
#   puts fest_dates.text
# end
# get_festival_dates(page_fest)

# def get_festival_music_type(page_fest)
#   fest_music_type = page_fest.xpath('//*[@id="root"]/main/div[1]/div[1]/div/div[1]/div[2]/ul[2]/li')
#   puts fest_music_type.text
# end
# get_festival_music_type(page_fest)
