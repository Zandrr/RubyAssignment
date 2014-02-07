class Word

	#palindrome (2)
	def palindrome?(string)

			string.downcase.gsub(/\W/, '') == string.downcase.gsub(/\W/, '').reverse #\W is any nonword character
	end

	#word count (3)

	def count_words(string)

    	count = Hash.new(0) #create empty hash

    	words = string.downcase.split(/\W+/) #creates array of words splitting at any non word char
    	words.each { |word| count[word]+=1 } #pipe each unique word into count hash and update its value + 1 each time

    	return count


	end



class WrongNumberOfPlayersError <  StandardError ; end

class NoSuchStrategyError <  StandardError ; end

 
	#rps (4a)
	def rps_game_winner(game)

	    raise WrongNumberOfPlayersError unless game.length == 2

		a = game[0][1].downcase
	    b = game[1][1].downcase

	    raise NoSuchStrategyError unless a and b == "r" or "p" or "s"

	    if (a == "r" and b == "s") or (a == "s" and b == "p") or (a == "p" and b =="r") or (a == b)
	    	return game[0]
	    else
	    	return game[1]
	 	end
	end
	#(4b)
		# Access the first element in game and get their choice
		# Access the second element in game and get their choice
		# Call rules on those two upcased element and print
		# If p2 beats p1 then it will call game[1] which will be the winner (p2)
		# If p1 beats p2 then it will call game[0] which will be the p1
	def rps_tournament_winner(tournament)
		print "tournament[0][0] is", tournament[0][0]
		print "tournament[0] is", tournament[0]
		print "tournament[1] is", tournament[1]
		if tournament[0][0].is_a?(Array)
			tournament = rps_tournament_winner(
				[rps_tournament_winner(tournament[0]),rps_tournament_winner(tournament[1])])
		else
			rps_game_winner(tournament)
		end
	end



#combine anagrams (5)
	def combine_anagrams(words)

  		words.sort.group_by { |i| i.chars.sort }.values

	end


end #end of word class
#(6)
def glob_match(filenames, patterns)

    patterns.gsub!(/[*?]/, '*' => '.*', '?' => '.')
    regex = Regexp.new(patterns)
    filenames.select do |filename|
        filename =~ regex
    end
end

# p glob_match(
#     ["part1.rb", "part2.rb", "part2.rb~", ".part3.rb.un~", ".part4.rb.un"],
#     "*part*rb?*")



#(7a)
class Dessert

	attr_accessor :name, :calories

    def initialize(name, calories)
        @name = name
        @calories = calories
    end



    def healthy?

      @calories < 200

    end

 

    def delicious?

        return true

    end

end

#(7b)
class JellyBean < Dessert

	attr_accessor :flavor
    def initialize(name, calories, flavor)
        @name = name
        @calories = calories
        @flavor = flavor
    end

 

    def delicious?

        if flavor == "black licorice"
        	return false
        else
        	return true
        end

    end

end

#(8)



class Class

    def attr_accessor_with_history(attr_name)

        attr_name = attr_name.to_s       # make sure it's a string

        attr_reader attr_name            # create the attribute's getter

        attr_reader attr_name+"_history" # create bar_history getter

        class_eval %Q"
            def #{attr_name}=(value)
                if !defined?
                 @#{attr_name}_history
                    @#{attr_name}_history = [@#{attr_name}]
                end
                @#{attr_name} = value
                @#{attr_name}_history << value
            end
        "
        

    end

end

 

class Foo

    attr_accessor_with_history :bar

end


#(9)


class Numeric

 @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
 def yen;   self*@@currencies["yen"]   ; end
 def euro;  self*@@currencies["euro"]  ; end
 def rupee; self*@@currencies["rupee"] ; end
 def dollar; self; end
 def in(currency); self*@@currencies[currency.to_s] ; end


 def method_missing(method_id)

   singular_currency = method_id.to_s.gsub( /s$/, '')

   if @@currencies.has_key?(singular_currency)

     self * @@currencies[singular_currency]

   else

     super

   end

 end

end












#(10a)
class String
	def palindrome?()
		self.downcase.gsub(/\W/, '') == self .downcase.gsub(/\W/, '').reverse #\W is any nonword character
	end
end
#(10b)
class Array
	include Enumerable
	def palindrome?()
		self == self.reverse #\W is any nonword character
	end
end

#(11)

class CartesianProduct

    include Enumerable

    attr_accessor :a, :b

    def initialize(a, b)
    	@a = a
    	@b = b
    	@c = @a.product(@b)

    end

    def each
    	if @a.length and @b.length >= 1
    		yield @c
    	else
    		return
    	end
    end
end














