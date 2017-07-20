require 'bitly'

class Url < ActiveRecord::Base

	validates :url, uniqueness: true
	
	
	before_create do
		create_short_url
	end
  
  def create_short_url
  	p 'x'*100
  	p url
  	#usamos la gema de bitle para crear un objeto usanod mi usuario y key app disponible en la palicacion de bitly
  	bitly = Bitly.new('dianabltavares', 'R_bbd62177b4e0457eb9c1234ebae8a223')
  	#estoy guardando en una variable el shorten de la url larga que introdujo el usuario. Este es un metodod de bitly, de ahi que lo llae con .shorthen(url) sobre la variable anterior
  	p urls_s = bitly.shorten(url)
  	#otra vez es un metodo de bitly, por eso el ., que manda solo la url corta y se la evia a la variable de short_url, que el nombre de la columna en la base de datos.
  	p self.short_url = urls_s.short_url
  end

  #esta seccion la creamos para el manejo de errores. usamos el comando .save! que a diferencia de .save que solo envia true o false si se guado o no el valor, .save! guarda el elemento que causo el error en el guardado, y con .to_s lo convierte en string y es posible verlo para ubicarlo rapidamente.
  def self.create_url (url)
    p "s"*100
    #creamos la instancia con el dato de la url (recuerda que antes de crearlo lo enviara el before_create)
    @model = Url.create(:url => url)
    #preguntamos si guardo o si no que enve el error
    @model.save!
    rescue ActiveRecord::RecordInvalid
      logger.error($!.to_s)
    end


end
