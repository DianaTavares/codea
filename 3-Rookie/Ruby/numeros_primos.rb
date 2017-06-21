require "prime"

def prime_factors (num)
	factors=[]
	prime_numbers=[]
	Prime.each(100) do |prime|
		if prime < num
			prime_numbers << prime
		else 
			break
		end
	end
	prime_position = 0
	while Prime.prime?(num)==false && num!=1
		while num % prime_numbers[prime_position] == 0
			factors << prime_numbers[prime_position]
			num = num / prime_numbers[prime_position]
		end
		prime_position += 1
	end 
	if Prime.prime?(num)
		factors << num
	end
	factors
end

p prime_factors(4) == [2, 2]
p prime_factors(9) == [3, 3]
p prime_factors(12) == [2, 2, 3]
p prime_factors(34) == [2, 17]

