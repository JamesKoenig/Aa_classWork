
class Employee
    #extend Manager
    attr_reader :name, :salary
    attr_accessor :boss
    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss
        boss.add_employee(self) if !boss.nil?
    end

    def bonus(multiplier)
        #non-manager
        @salary * multiplier
    end
end


class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @employees = []
    end
    
    def add_employee(employee)
        @employees << employee
    end

    def bonus(multiplier)
         #bonus = (total salary of all sub-employees) * multiplier
        self.bonus_helper * multiplier
    end
    
    def bonus_helper
        sum = 0
        @employees.each do |ee|
            if ee.is_a?(Manager)
                sum += ee.bonus_helper + ee.salary
            else
                sum += ee.salary
            end
        end
        sum
    end

end

ned = Manager.new("Ned", "founder", 1000000)
darren  = Manager.new("Darren","TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000