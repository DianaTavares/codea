class User < ActiveRecord::Base
  include ActiveModel::Validations

  #agregamos la dependencia de uno a muchos.
  has_many :urls

  validates :name, :email, :password, presence: true
  #validates :email, :email => true
  validates :email, uniqueness: true
  

  def self.authenticate(email, password)
    user=User.find_by_email(email)
    #verificamos si encontro un usuario o no
    if user
      #verifica si la contraseña enviada por el usuario corresponde a la que se tiene registrado en la base de datos
      if user.password == password
        p '*'*50
        p "entre, si encontre al usuario #{user}"

        #si lo encuentra, regresa el usuario
        return user
      else
        #si no lo encuentra, regresa un vacio
        return 1
      end
    # si no encuentra al usuario, regresa un vacio
    else
      return 2
    end
  end

end
