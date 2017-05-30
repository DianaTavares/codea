class Computer
  attr_accessor :color
  attr_reader :processor
  def initialize(color,processor)
    @color=color
    @processor=processor
  end
end
mac=Computer.new("white","Intel")
#test
mac.processor
#=>"Intel"
mac.processor = "AMD"
#=>...undefined method `processor='...