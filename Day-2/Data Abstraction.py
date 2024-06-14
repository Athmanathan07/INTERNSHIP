class Employee:
    def __init__(self, name, age, salary):
        self.name = name
        self.age = age

        self.__salary = salary

    def get_salary(self):
        return self.__salary

    def set_salary(self, new_salary):
        if new_salary > 0:
            self.__salary = new_salary
        else:
            print("Invalid salary")


employee = Employee("John", 30, 5000)

print(employee.get_salary())

employee.set_salary(6000)


print(employee.get_salary())