require 'open-uri'
require 'nokogiri'
require 'json'


# page list of festivals (url)
page_all_festivals = Nokogiri::HTML(open('https://www.festicket.com/fr/countries/france/'))

def get_festivals_url(page_all_festivals)
  # all_festivals_url = page_all_festivals.css("a")
  # puts all_festivals_url[19]["href"]
  all_festivals_url = page_all_festivals.xpath('//a[starts-with(@href, "/fr/festival")]')
  puts all_festivals_url
end
get_festivals_url(page_all_festivals)["href"]



  # # creation of the array
  # array_festivals_url = []
  # get_festivals_url(page_all_festivals).each do |link|
  #   array_festivals_url << link.text
  # end


  # # assembling piece of url in the array to get full url 
  # array_festival_link = []
  # array_festivals_url.each do |x|
  #     url = Nokogiri::HTML(open('https://www.festicket.com/fr/festivals/' + x))
  #     link = url.xpath('')
  #     array_links << link.text
  # end