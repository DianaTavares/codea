class Vitamin
  def a_public_method
    "Will this work? " + a_protected_method
  end

  private

  def a_protected_method
    "Yes, I'm protected!"
  end
end

class Candy < Vitamin

end

vitamin = Candy.new
p vitamin.a_public_method == "Will this work? Yes, I'm protected!"