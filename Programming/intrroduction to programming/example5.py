

#  switch statement in python

day_of_week = 3

match day_of_week:
    case 1:
        day_name = 'Monday'
        print(day_name)
    case 2:
        day_name = 'Tuesday'
        print(day_name)
    case 3:
        day_name = 'Wednesday'
        print(day_name)   
    case unknown_command:
        print("Invalid")
        
        