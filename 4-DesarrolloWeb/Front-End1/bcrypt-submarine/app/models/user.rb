class User < ActiveRecord::Base
  #Relacion con la tabla de rounds
  has_many :rounds

  #Validaciones
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create


end
