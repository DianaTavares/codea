#para entender el funcinamiento de un browser, imitaremos uno con codigo ruby

require 'rubygems'
require 'net/http'
require 'nokogiri'
require 'open-uri'

class Page
  def initialize(url)
    @url = url
    @res = Net::HTTP.get_response(URI.parse(@url))
    @parseado = Nokogiri::HTML(@res.body)
  end
#Sabe hacer un http request y guarda la respuesta para usarse en otros métodos
  def fetch!
    puts "Fetching..."
    puts "Título: #{title}"
    puts "links:"
    links.each do |i|
      puts "    #{i.inner_text}: #{i['href']}"
    end
  end
#regresa un array de los links de la página (texto/url)
  def links
    link=[]
    @parseado.search(".nav-item > a").each do |i|
      link<< i
    end 
    link
  end
#Regresa el titulo de la página
  def title
    title = @parseado.search("title")
    title.first.inner_text
  end
end

class Browser
  def run!(url)
    page=Page.new(url)
    page.fetch!
  end
end

#el metodo de links no funciona para todas las paginas ya que e base ne la de codeacamp y la clase usada para identificar los links de navegación es diferente para otras paginas. 
url="hola"
while url!='exit'
  puts "¿Qué navegador quieres visitar?"
  url=gets.chomp
  if url != 'exit'
    Browser.new.run!(url)
  end
end



