=begin
#primero guardamos el url de una cuenta de twitter
https://twitter.com/CH14_

#en la consola (dentor de la carpeta donde voy a querer guardar todo) creo un documento html, copiando la info del url copiada en el pso anterior con el comando 
curl 'https://twitter.com/CH14_' > twitter_account.html

#Dentro de la consola irb, primero instalo la gema NOKOgiri que convierte el arhivo html en un objeto con el codigo:
require 'nokogiri'

doc = Nokogiri::HTML(File.open('twitter_account.html'))

# ¿Qué clase tiene doc ? con:
doc.class
#obtuve Nokogiri::HTML::Document

#linea de codigo de CSS selector que permiten acceder a partes del codigo del html-->objeto ruby que tengan esa caracterisica CSS

profile_name = doc.search(".ProfileHeaderCard-name > a")

#lo que se ve entre "" puede cambiarse por otros de los Css selctor, algunos ejemplos en: https://www.w3schools.com/cssref/css_selectors.asp

#para entrar a la opcion de inspector, para ver el html de la pagina y revisar en la vista a que corresponde cada parte se usa click derecho y seleccionar inspector.
=end

require 'open-uri'
require 'nokogiri'

class TwitterScrapper
  def initialize(url)
    @url = Nokogiri::HTML(open(url))
  end

  def extract_username
    name = @url.search(".ProfileHeaderCard-name > a")
    puts
    puts "Username: #{name.first.inner_text}" 
    puts '-'*60
  end

  def extract_tweets
    all=[]
    tweets=@url.search(".TweetTextSize")
    fecha=@url.search("._timestamp")
    @url.search(".ProfileTweet-actionCount").children.each do |i|
      all << i.inner_text
    end
    all.each do |i|
      i.strip!
    end
    all.reject! {|x| x.empty?}
    puts "Tweets:"
    (0..tweets.length-1).each do |i|
      p "  #{fecha[i].inner_text}: #{tweets[i].inner_text}"
      puts "  #{all[i*3]}  #{all[i*3+1]}  #{all[i*3+2]}"
    end


  end

  def extract_stats
    info=@url.search(".ProfileNav-value")
    tweets=info.first.inner_text
    following=info[1].inner_text
    followers=info[2].inner_text
    puts "Stats: Tweets: #{tweets.strip!}, Siguiendo: #{following}, Seguidores #{followers}"
    puts '-'*60
  end

end

puts "¿Qué cuenta de twitter quieres revisar?"
url=gets.chomp
user1=TwitterScrapper.new(url)
user1.extract_username
user1.extract_stats
user1.extract_tweets








