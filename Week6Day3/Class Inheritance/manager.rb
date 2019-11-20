require_relative "employee"
require "byebug"
class Manager < Employee

    attr_accessor :bonus, :employees
    attr_reader :name, :title, :salary, :boss

     def initialize(name,title,boss,favorite_employee)

        super(name, title, boss)

        @employees = []
        @favorite_employee = favorite_employee
    end
    #debugger

    def add_employee(employee)
        @employees << employee
        employee.boss = self
    end
    
    def bonus(multiplier)
        x = 0 
        @employees.each do |worker| 
            x += worker.salary
        end
        @bonus = x * multiplier
    end

end
ned = Manager.new("neal", "founder", nil, "bob")
ned.salary = 10000
#debugger

#define error 1
ted = Employee.new("ted","janitor",ned)
ted.salary = 200

fred = Employee.new("fred","assistant", ned)

bread = Employee.new("bread","assistant's assistant", fred)

ned.add_employee(ted)
ned.add_employee(fred)

p ned.bonus(5)
p ted.bonus(3)

#p bread.boss