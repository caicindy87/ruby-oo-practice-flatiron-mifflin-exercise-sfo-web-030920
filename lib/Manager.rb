class Manager
    attr_reader :name, :department, :age

    @@all = []

    def initialize(name, department, age)
        @name = name
        @department = department
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def employees
        Employee.all.select{|employee| employee.manager_name == self.name}
    end

    def hire_employee(employee_name, employee_salary)
        Employee.new(employee_name, employee_salary, self)
    end

    def self.all_departments
        Manager.all.map{|manager| manager.department}
    end

    def self.average_age
        ages = Manager.all.map{|manager| manager.age}
        ages.reduce(:+) / (ages.length)
    end
end


#done:
# **`Manager`**
#   * `Manager#name`
#     * returns a `String` that is the manager's name
#   * `Manager#department`
#     * returns a `String` that is the department that the manager oversees
#   * `Manager#age`
#     * returns a `Fixnum` that is the age of the manager
#   * `Manager.all`
#     * returns an `Array` of all the managers
#   * `Manager#employees`
#     * returns an `Array` of all the employees that the manager oversees
#   * `Manager#hire_employee`
#     * takes a `String` argument and a `Fixnum` argument of an employee's name and the employee's salary, respectively, and adds that employee to the list of employees that the manager oversees
#   * `Manager.all_departments`
#     * returns an `Array` of all the department names that every manager oversees
#   * `Manager.average_age`
#     * returns a `Float` that is the average age of all the managers