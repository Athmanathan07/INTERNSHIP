class MyClass:
    def __init__(self):
        self.__hidden_var = 0

    def get_hidden_var(self):
        return self.__hidden_var  

    def set_hidden_var(self, value):
        self.__hidden_var = value


obj = MyClass()

obj.set_hidden_var(10)  # Sets the hidden variable to 10

print(obj.get_hidden_var())