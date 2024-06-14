#Area_Calculator

def Area_calculator(shape, dimensions):
    if shape.lower() == "rectangle":
        if len(dimensions) == 2:
            length, width = dimensions
            print("Area of rectangle :",length * width)
        else:
            print("this is not a rectangle")
    if shape.lower()=="circle":
        if type(dimensions) == int:
            radius=dimensions
            print("Area of circle :",3.14*radius*radius)
        else:
            print("this is not a circle")

Area_calculator("Rectangle",(7,5))
Area_calculator("circle",(2,5))

        
    
    
