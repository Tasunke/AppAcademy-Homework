class Employee

    attr_accessor :salary
    attr_reader :boss

    def initialize(name,title,boss)
        @name = name 
        @salary = 100
        @title = title 
        @boss = boss
        #@bonus = 1
    end

    def bonus(multiplier)
      bonus = self.salary * multiplier
    end

    # def employee(subordinate)
    # end

    # def inspect(employee)
    #     employee
    # end



end