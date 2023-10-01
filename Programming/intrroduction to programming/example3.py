
# conditional control structures: we can form block of code.
from random import choice

pronouns = ["CI/CD", "ETL/ELT"]

value = "CSV/PSV"

if value in pronouns:
    print("Recognized")
else:
    print("Unrecognized")