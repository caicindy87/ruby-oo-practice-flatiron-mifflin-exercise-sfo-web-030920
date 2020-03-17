class Employee
    attr_reader :name, :salary, :manager_name
    attr_accessor :manager # allows us to assign employee_obj.manager = manager_obj
 

    @@all = []

    def initialize(name, salary, manager_name)
        @name = name
        @salary = salary
        @manager_name = manager_name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.paid_over(num)
        Employee.all.select{|employee| employee.salary > num}
    end

    def self.find_by_department(department_name)
        manager = Manager.all.find{|manager| manager.department == department_name}
        Employee.all.find{|employee| employee.manager_name == manager.name}
    end

    def tax_bracket(employee_obj)
        max = Employee.all.select{|employee| employee.salary <= (employee_obj.salary + 1000)}
        min = max.select{|employee| employee.salary >= (employee_obj.salary - 1000)}
    end
end



# Done:
# **`Employee`**
#   * `Employee#name`
#     * returns a `String` that is the employee's name
#   * `Employee#salary`
#     * returns a `Fixnum` that is the employee's salary
#   * `Employee#manager_name`
#     * returns a `String` that is the name of their manager
#   * `Employee.all`
#     * returns an `Array` of all the employees
#   * `Employee.paid_over`
#     * takes a `Fixnum` argument and returns an `Array` of all the employees whose salaries are over that amount
#   * `Employee.find_by_department`
#     * takes a `String` argument that is the name of a department and returns the first employee whose manager is working in that department
#   * `Employee#tax_bracket`
#     * returns an `Array` of all the employees whose salaries are within $1000 (± 1000) of the employee who invoked the method
