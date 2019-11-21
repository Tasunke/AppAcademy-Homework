class Employee

    attr_accessor :salary, :employees
    attr_reader :boss

    def initialize(name,title,boss=nil)
        @name = name 
        @salary = 100
        @title = title 
        @boss = boss
        #@bonus = 1
        @employees = []
    end

    def bonus(multiplier)
      bonus = self.salary * multiplier
    end

    def boss=(boss)
        @boss = boss
    end
    # def employee(subordinate)
    # end

    # def inspect(employee)
    #     employee
    # end



end