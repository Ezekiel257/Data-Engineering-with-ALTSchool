
# ALT School receives payment from 3 file formats - XML, JSON and YAML/YML

# accepted format - XML, JSON and YAML

ACCEPTED_FORMAT = ["json", "xml", "yml"]

value_from_payment_partner = "csv"

if value_from_payment_partner == ACCEPTED_FORMAT[0]:
    print("The file is a valid JSON file")
elif value_from_payment_partner == ACCEPTED_FORMAT[1]:
    print("The file is a valid XML file")
elif value_from_payment_partner == ACCEPTED_FORMAT[2]:
    print("The file is a valid YML file")
else:
    # send a message to slack
    print(f"The file is not a valid payment file! expected one of {ACCEPTED_FORMAT}")
    


        
    
    