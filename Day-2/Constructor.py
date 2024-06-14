# Constructor without arguments

class MyClass:
    def __init__(self):
        self.data = 45


obj = MyClass()
print(obj.data)

#Constructor with arguments

class MyClass:
    def __init__(self, value):
        self.data = value

obj = MyClass(3)
print(obj.data)

#Constructor with default arguments

class MyClass:
    def __init__(self, value=0): 
        self.data = value  

obj1 = MyClass()  
print(obj1.data)  

obj2 = MyClass(78)  
print(obj2.data)