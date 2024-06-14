class MyClass:
    def __init__(self):
        self.__private_var = 9

    def get_private_var(self):
        return self.__private_var

    def set_private_var(self, value):
        self.__private_var = value

obj = MyClass()

print(obj.get_private_var())

obj.set_private_var(136)
print(obj.get_private_var())