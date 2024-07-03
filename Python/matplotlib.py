import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# Generate the data
x_1 = np.linspace(0, 5, 10)
y_1 = x_1**2

# Create the plot
plt.plot(x_1, y_1)

# Add title and labels
plt.title('Days Squared Chart')
plt.xlabel('Days')
plt.ylabel('Days Squared')

# Display the plot
plt.show()
