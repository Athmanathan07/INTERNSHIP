class Shape:

  def info(self):
    print(f"I am a {type(self).__name__}.")

class ColoredShape(Shape):

  def __init__(self):
    pass

  def info(self):
    super().info() # Call info from Shape
    print(f"I am also colored.")

class RedSquare(ColoredShape):


  def info(self):
    super().info()
    print(f"I am a red square.")


red_square = RedSquare()

red_square.info()