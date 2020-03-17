require_relative "lib/Manager"
require_relative "lib/Employee"
require 'pry'


#Test your code here
manny = Manager.new("manny", "sales", 45)
todd = Manager.new("todd", "marketing", 30)

bob = Employee.new("bob", 60000, "manny")
steve = Employee.new("steve", 61000, "manny")
alex = Employee.new("alex", 59500, "manny")
anna = Employee.new("anna", 60500, "manny")
fred = Employee.new("fred", 1000000, "manny")
john = Employee.new("john", 40000, "manny")


binding.pry
puts "done"
