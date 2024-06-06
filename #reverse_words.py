#reverse_words

def reverse_words(text):
    if type(text)==str:
        words = text.split()
        reversed_words = words[::-1]
        reversed_text = ' '.join(reversed_words)
        print(reversed_text)
    else:
        return "Input is not a string"

reversed_text = reverse_words("hi hello")
