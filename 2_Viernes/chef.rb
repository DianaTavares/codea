#Uninedo fuerzas y manejando una base de datos desde código Ruby

require 'sqlite3'

class Chef

  attr_accessor :first_name, :last_name, :birthday, :email, :phone, :created_at, :updated_at

  def initialize(first_name, last_name, birthday, email, phone, created_at, updated_at)
    @first_name = first_name
    @last_name = last_name
    @birthday = birthday
    @email = email
    @phone = phone
    @created_at = created_at
    @updated_at = updated_at
  end

  def self.create_table
    Chef.db.execute(
      <<-SQL
        CREATE TABLE chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday  DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Ferran', 'Adriá', '1985-02-09', 'ferran.adria@elbulli.com', '42381063238', DATETIME('now'), DATETIME('now')),
          ('Diana', 'López', '1988-10-06', 'diana@htomail.com', '47737896852', DATETIME('now'), DATETIME('now')),
          ('Gerardo', 'Arrioja', '1996-12-16', 'eljeras@yahoo.com', '1547896325', DATETIME('now'), DATETIME('now')),
          ('Mariana', 'Morales', '1980-05-16', 'marianitammorales@yahoo.com', '7156981234', DATETIME('now'), DATETIME('now')),
          ('Sandoval', 'Cristian', '1885-01-27', 'donchava@live.com', '78945612301', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end

  def save
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs 
          (first_name, last_name, birthday, email, phone, created_at, updated_at) 
        VALUES 
          ("#{@first_name}", "#{@last_name}", "#{@birthday}", "#{@email}", "#{@phone}", "#{@created_at}", "#{@updated_at}");
      SQL
    )
  end

  private

  def self.db
    @@db ||= SQLite3::Database.new("chefs.db")
  end
  #Metodo para visualizar todo los registros de la base de datos
  def self.all
    Chef.db.execute(
    <<-SQL
      SELECT * FROM chefs;
    SQL
    )
  end
  #metodo para hacer consultas con condicional Where.
  def self.where(column, value)
    Chef.db.execute(" SELECT *
                  FROM chefs
                  WHERE #{column} = ?",value)
  end
  #Metodo para eliminar una registro de la base de datos. 
  def self.delete(column, value)
    Chef.db.execute("DELETE FROM chefs WHERE #{column} = #{value}")
  end

  #Metodo para crear in nuevo registro y guardaro en la base de datos


end

#Para crear un nuevo registro:
# chef=Chef.new(first_name="Lorena", last_name="Ramirez", birthday="1985-07-02", email="Lorena_ram@gmail.com", phone="477789685215", created_at="2017-06-05", updated_at="2017-06-05")
