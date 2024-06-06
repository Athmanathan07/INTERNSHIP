#filter_short_names


product_names = ["Laptop","Smartphone","Tablet","Smartwatch","Monitor","Keyboard","Mouse","Headphones"]

def filter_short_names(names, max_length):
    filtered_names = list(filter(lambda name: len(name) < max_length, names))
    return filtered_names

max_length =6
short_names = filter_short_names(product_names, max_length)
print(short_names)