#analyze_list

def analyze_list(numbers):
    if type(numbers)==list:
        a=(min(numbers))
        b=(max(numbers))
        c=(sum(numbers)/len(numbers))
        l={"min":a,"max":b,"avg":c}
        print(l)

analyze_list([8,6,2,33,777,455454,4874187,4784,78487,47,484,87])
