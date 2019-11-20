#Test# PHASE 2
  def convert_to_int(str)
        begin
            Integer(str)
        #raise "Argument Error"
        rescue ArgumentError => e 
         puts "Improper Argument cannot convert #{str} to integer"
         nil
        else
        Integer(str)
        end
  end
#   p convert_to_int("5")
#   p convert_to_int(5)
#   p convert_to_int("c")
 
  # def convert_to_int(str)
  #   numbers = ["0","1","2","3","4","5","6","7","8","9"]
  #   if str.is_a?(Array)
  #     var = str 
  #   else
  #     var = [str]
  #   end
  #   unless numbers.include?(str)
  #     raise ArgumentError.new "Cannot convert a character into an integer"
  #   end
  #   Integer(str)
  # end

#  p convert_to_int("five")

# def sqrt(num)
#   unless num >= 0
#     raise ArgumentError.new "Cannot take sqrt of negative number"
#   end

#   # code to calculate square root...
# end

# def main
#   # run the main program in a loop
#   while true
#     # get an integer from the user
#     puts "Please input a number"
#     num = gets.to_i

#     begin
#       sqrt(num)
#     rescue ArgumentError => e
#       puts "Couldn't take the square root of #{num}"
#       puts "Error was: #{e.message}"
#     end
#   end
# end


  
  #p 4.to_s
  # PHASE 3
  FRUITS = ["apple", "banana", "orange"]
  
  def reaction(maybe_fruit)
    begin
        if FRUITS.include? maybe_fruit
            puts "OMG, thanks so much for the #{maybe_fruit}!"
        end
    rescue StandardError => e  
    end

  end
  
  def feed_me_a_fruit
    puts "Hello, I am a friendly monster. :)"
  
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 

  end  
  
  # PHASE 4
  class BestFriend
    def initialize(name, yrs_known, fav_pastime)
      @name = name
      @yrs_known = yrs_known
      @fav_pastime = fav_pastime
    end
  
    def talk_about_friendship
      puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
    end
  
    def do_friendstuff
      puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
    end
  
    def give_friendship_bracelet
      puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
    end
  end
  
  
  