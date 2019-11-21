require_relative "employee"
require "byebug"
class Manager < Employee


    # Founder
    # |     \
    # CEO     CFO
    # |  \       |   \ 
    # MA  MB     MC   MD

    attr_accessor :bonus, :employees
    attr_reader :name, :title, :salary, :boss



     def initialize(name,title,boss=nil,favorite_employee)

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
        @employees.each.salary do |worker| 
            worker.emplyees.each do |sub|
                x += sub_salary(sub)
            end
        end
        @bonus = x.sum * multiplier
    end


    def sub_salary(worker)
        workers_salaries = []
        return workers_salaries.sum if worker.employees.nil?
        
        worker.employees.each do |w|
            workers_salaries += sub_salary(w)
        end

    end

    # def bonus(multiplier)
    #     x = 0 
    #     @employees.each do |worker| 
    #         if worker.employees.length > 0 
    #             worker.employees.each do |sub_worker|
    #                 x += sub_worker.salary
    #             end
    #         end 
    #         x += worker.salary
    #     end
    #     @bonus = x * multiplier
    # end

end
ned = Manager.new("neal", "founder", nil, "bob")
ned.salary = 10000
#debugger

#define error 1
ted = Employee.new("ted","janitor",ned)
ted.salary = 200

fred = Manager.new("fred","assistant", ned, "bread")

bread = Manager.new("bread","assistant's assistant", fred, "carrot")
bread.salary = 10

carrot = Employee.new("carrots", "coffee-man", bread)
carrot.salary = 100000

ned.add_employee(ted)
ned.add_employee(fred)

fred.add_employee(bread)
p ned.bonus(5)
p ted.bonus(3)
#p ted.boss

#p bread.boss