



def unify(x, y, substitution=None):

    if substitution is None:
        substitution = {}

    if x == y:
        return substitution

    if isinstance(x, str) and x.isupper():
        substitution[x] = y
        return substitution

    if isinstance(y, str) and y.isupper():
        substitution[y] = x
        return substitution

    return None

print("Unification Example:")

result = unify("X", "John")

if result:
    print("Unification Successful:", result)
else:
    print("Unification Failed")


print("\nResolution Example:")

human = "Socrates"
query = "Socrates"

if human == query:
    print("Human(Socrates) is TRUE")
    print("Mortal(Socrates) is TRUE")
    print("Resolution Successful!")
else:
    print("Resolution Failed!")
