class Shape:

    def area(self):
        raise NotImplementedError("Subclasses must implement area()")


class Square(Shape):

    def __init__(self, length):
        self.length = length

    def area(self):
        return self.length * self.length


class Circle(Shape):

    def __init__(self, diameter):
        self.diameter = diameter

    def area(self):
        radius = self.diameter / 2
        return 3.14 * radius * radius


square_object = Square(8)
circle_object = Circle(10)


print(f"Area of square: {square_object.area()}")
print(f"Area of circle: {circle_object.area()}")