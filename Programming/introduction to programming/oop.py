


# class: student
class Student:
    
    def __init__(first_name, last_name, email, age, self):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.age = age
        
    
    def create_student(self):
        pass
        
    def introduce(self):
        print(f"My name is {self.first_name} {self.last_name}")
        
        



if __name__ == "__main__":
    
    print("Welcome to my Student Bio Data System.\n 1. Create New Student")
    
    first_name = input("Enter First Name: ")
    last_name = input("Enter Last Name: ")
    email = input("Enter Email Add: ")
    age = int(input("Enter Age: "))
    
    student = Student(first_name, last_name, email, age)
    
    print(student.first_name)
    
    
    
    
    