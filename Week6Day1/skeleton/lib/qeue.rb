class Queue
    def initialize
      @underlying_array = []
    end
  
    def enqueue(el)
      underlying_array.push(el)
      el
    end
  
    def dequeue
      underlying_array.shift
    end
  
    def peek
      underlying_array.first
    end
  
    private
  
    attr_reader :underlying_array
    
  end