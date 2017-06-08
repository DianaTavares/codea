#para entender el funcinamiento de un browser, imitaremos uno con codigo ruby
=begin
require 'net/http'
require 'nokogiri'
require 'open-uri'

class Page
  def initialize(url)
  end
#Sabe hacer un http request y guarda la respuesta para usarse en otros métodos
  def fetch!
  end
#regresa un array de los links de la página (texto/url)
  def links
  end
#Regresa el titulo de la página
  def title
  end
end

class Browser
  def run!
  end
end

Browser.new.run!

res = Net::HTTP.get_response(URI('http://www.google.com/index.html'))
print res.body
=end

require 'net/http'
require 'rexml/document'
 
# Búsqueda web de la palabra "madonna"
url = 'http://api.search.yahoo.com/WebSearchService/V1/webSearch?appid=YahooDemo&query=madonna&results=2'
 
# obtener los datos xml como una cadena
xml_data = Net::HTTP.get_response(URI.parse(url)).body
 
# extraer la información del evento
doc = REXML::Document.new(xml_data)
titles = []
links = []
doc.elements.each('ResultSet/Result/Title') do |ele|
    p ele.text
   titles << ele.text
end
doc.elements.each('ResultSet/Result/Url') do |ele|
   links << ele.text
end
 
# imprimir todos los eventos
titles.each_with_index do |title, idx|
   print "from, #{title} => #{links[idx]}\n"
end