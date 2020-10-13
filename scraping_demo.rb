require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from https://www.bbcgoodfood.com/search/recipes?q=chocolate
ingredient = "chocolate"
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"


# I want a list of every recipe with chocolate.

#1 Open the url and read it -> transform into a html string
html_string = open(url).read

# Nokogiri gem transforms html string into Nokogiri::HTML objects
# which can be easily parsed and we can search for anything we want there.

html_doc = Nokogiri::HTML(html_string)

#search the nokogiri::html for every element that have
# standard-card-new__article-title as a class name
# class selector: .
# id selector: #

html_doc.search(".standard-card-new__article-title").each do |element|
  puts element.text
end


