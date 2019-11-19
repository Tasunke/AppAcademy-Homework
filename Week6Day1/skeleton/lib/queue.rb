class Queue
    def initialize
      @underlying_array = []
    end
  
    def enqueque(el)
      underlying_array.push(el)
      el
    end
  
    def dequeque
      underlying_array.shift
    end
  
    def peek
      underlying_array.first
    end
  
    private
  
    attr_reader :underlying_array
    
  end