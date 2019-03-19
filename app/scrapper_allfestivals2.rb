require 'open-uri'
require 'nokogiri'
require 'json'


  # page list of festivals (url)
  x = 1
  array_festivals_url = []
  27.times do 
    page_all_festivals = Nokogiri::HTML(open('https://www.touslesfestivals.com/agenda/liste?page=' + x.to_s))


    def get_festival_url(page_all_festivals)
      fest_title = page_all_festivals.xpath('//*/ul[1]/li/a[starts-with(@href, "https://www.touslesfestivals.com")]')
      # fest_title = page_all_festivals.css('')
      # fest_title.each do |fest|
      #   puts "#{fest[:href]}" 
      # end
    end
    # creation of the array
    
    get_festival_url(page_all_festivals).each do |link|
      array_festivals_url << link[:href]
    end
    
    x += 1
  end
  array_festivals_url.delete("https://www.touslesfestivals.com/mentions-legales")
  # puts array_festivals_url.uniq


  array_festivals_details = []

  array_festivals_url.each do |page|
    fest_page = Nokogiri::HTML(open(page))

    def get_festival_title(fest_page)
      # fest_title = fest_page.css('h1.event-title')
      fest_title = fest_page.xpath('/html/body/main/div/div/section/div/div[1]/div[1]/div/h1')
      return fest_title.text
    end
    

    def get_festival_city(fest_page)
      # fest_city = fest_page.css('div.event-header-infos-date meta.ville')
      fest_city = fest_page.xpath('/html/body/main/div/div/section/div/div[1]/div[1]/div/div[1]/span[2]/meta[5]')
      fest_city.each { |city| return city[:content] }
    end


    def get_festival_website(fest_page)
      # fest_website = fest_page.css('ul.event-links.event-sub-info li a')
      fest_website = fest_page.xpath('/html/body/main/div/div/section/div/div[1]/div[1]/div/ul/li/a')
      fest_website.each { |website| return website[:href] }
    end
    

    def get_festival_start(fest_page)
      fest_start = fest_page.css('div.event-header-infos-date meta')[0]
      fest_start[:content]
    end
    

    def get_festival_end(fest_page)
      fest_end = fest_page.css('div.event-header-infos-date meta')[1]
      fest_end[:content]
    end
    

    def get_festival_type(fest_page)
      fest_type = fest_page.xpath('/html/body/main/div/div/section/div/div[1]/div[1]/div/div[2]')[0]
      # puts fest_type.text
    end

    def update_festivals_array(array_festivals_details, fest_page)
      array_festivals_details << {title: get_festival_title(fest_page), address: get_festival_city(fest_page), website: get_festival_website(fest_page), start_date: get_festival_start(fest_page), end_date: get_festival_end(fest_page) }
    end
    
    def save_as_JSON(array_festivals_details, fest_page)
      File.open("../db/festivals_details.json","w") do |f| 
      f.write(JSON.pretty_generate(update_festivals_array(array_festivals_details, fest_page)))
      end
    end

    save_as_JSON(array_festivals_details, fest_page)

  end

puts "execution du fichier scrapper_allfestivalls2.rb"