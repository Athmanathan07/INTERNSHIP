#analyze_text

def analyze_text(text):

    words = text.lower().split()

    num_words = len(words)

    num_characters = len("".join(text.split()))

    word_freq = {}
    for word in words:
        if word in word_freq:
            word_freq[word] += 1
        else:
            word_freq[word] = 1

    most_frequent_word = max(word_freq, key=word_freq.get)

    result = {
        "word_count": num_words,
        "character_count": num_characters,
        "most_frequent_word": most_frequent_word,
    }

    return result


text = "This is analyze text question."
result = analyze_text(text)
print(result)