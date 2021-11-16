# int, int -> [int]
# From, To -> List of Primes
# Generate a list of primes using Eratosthenes
def eratosthenes(from = 2, to = 100)

	# init
	res = []
	if from <= 2
		from = 2
		res.append(2)
	end
	sqrt = Math.sqrt(to).to_i

	# Precull 2's
	from.upto(to) do |i| 
		res.append(i) if i.odd?
	end

	# puts "Starting with: #{res}"  # DEBUG

	# algo
	3.upto(sqrt) do |i|
		if i.even?  
			next
		end

		progress = ((i.to_f / sqrt) * 100).to_i
		print "#{progress}% " # DEBUG

		multiple = first_multiple(i, from) + i
		while multiple <= to
			res.delete(multiple)
			# puts "Deleting #{multiple}" # DEBUG
			multiple += i
		end
		
	end

	puts # DEBUG
	res
end

# int, int -> int
# Usage: first_multiple_above(7, 30) => 28
def first_multiple(lower, higher) 
	if lower > higher
		lower
	elsif higher % lower == 0
		higher
	else
		higher / lower * lower
	end
end
