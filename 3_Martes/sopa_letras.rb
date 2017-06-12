class Board
# You should put here the given boards templates
   #@@boards_templates = [["POEMA", "CANCION", "RONDAS", "RIMAS"],"POEMAXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR"] 
   #@@boards_templates =[["MANGO", "SANDIA", "MELON", "PLATANO"],"XXXXPXXXXLXAMXAXIEXTXDLXAXNOXNMANGOXSXXX"]
   @@boards_templates = [["ROJO", "VERDE", "AZUL", "NEGRO"],"OJORXXXXXXXEXXOXDXRXXRGLXXEXUXNVXZXXXXAX"]
  def initialize
     to_s(complete_board!)
  end

  def to_s(array)
    @@final_board=[]
    array.each_slice(5){ |i| @@final_board << i}
    puts
    @@final_board.each do |i| 
      i.each do |j|
        print j. ljust(3)
      end
      puts
    end
    puts
  end

  def include?(word)
    include_horizontal?(word)
    include_vertical?(word)
    include_pendiente_negativa(word)
    include_pendiente_positiva(word)
  end

  def include_horizontal?(word)
    if @@final_board.join.include? word 
      puts " #{word} Se encontro de forma horiontal"
      return true
    elsif @@final_board.join.reverse.include? word
      puts "#{word} Se encontro de forma horizontal invertida"
      return true
    else
      return false
    end
  end

  def include_vertical?(word)
    vertical=[]
    (0..4).each do |c|
      8.times { |x| vertical << @@final_board[x][c]}
    end
    if vertical.join.include? word
      puts " #{word} Se encontro de forma vertical"
      return true
    elsif vertical.join.reverse.include? word
      puts "#{word} Se encontro de forma vertical invertida"
      return true
    end
  end

  def include_pendiente_negativa(word)
    diagonal=[]
    (1..4).each do |i|
     diagonal << @@final_board[i-1][i]
    end
    (0..3).each do |j|
      (0..4).each do |i|
        diagonal<<@@final_board[i+j][i]
      end
    end
    (0..3).each do |i|
      diagonal << @@final_board[i+4][i]
    end
    if diagonal.join.include? word
      puts " #{word} Se encontro de forma diagonal negativa hacia abajo"
      return true
    elsif diagonal.join.reverse.include? word
      puts "#{word} Se encontro de forma diagonal negativa hacia arriba"
      return true
    end
  end

  def include_pendiente_positiva(word)
    diagonal=[]
    (0..3).each do |i|
      diagonal<<@@final_board[3-i][i]
    end
    (4..7).each do |j|
      (0..4).each do |i|
        diagonal<<@@final_board[j-i][i]
      end
    end
    (1..4).each do |i|
      diagonal<<@@final_board[8-i][i]
    end
    if diagonal.join.include? word
      puts "#{word} Se encontro de forma diagonal positiva hacia arriba"
      return true
    elsif diagonal.join.reverse.include? word
      puts "#{word} Se encontro de forma diagonal positiva hacia abajo"
      return true
    end
  end

  private

  def complete_board!
        #Este método debe rellenar un tablero incompleto, en otras palabras cambiar las "x" por letras random.
        c=("A".."Z").to_a
        a=[]
        board=@@boards_templates[1]
        for i in 0..board.length-1
          if board[i]=="X"
            #shuffle es el que elige de manera random una de las letras del arreglo c que ocntiene todas las letras del alfabeto. 
            board[i]=c.shuffle[1]
          end
          #guardamos cada caracter del board como elemento0 de un arreglo para poderlos imprimir despues
          a << board[i]
        end
        a
  end
end

board = Board.new
board.include?("ROJO")
board.include?("AZUL")
board.include?("VERDE")
board.include?("GD")
board.include?("NEGRO")