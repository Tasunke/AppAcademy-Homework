#this isn't what Kafka esque meant my dudes ...


def is_prime?(num)
    return false if num < 2
    (2...num).each do |n|
        if num % n == 0 
            return false
        end
    end
    true

end