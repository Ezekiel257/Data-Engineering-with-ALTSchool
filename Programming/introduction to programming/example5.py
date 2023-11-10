import os
import json
import csv
import time

# import pandas as pd


# Define the directory where your JSON files are located
ABSOLUTE_PATH = r"/Users/HP/Desktop/Data-Engineering-with-ALTSchool/Programming/introduction to programming/example5.py"
CARDS_PATH = "events/cards"
USERS_PATH = "events/users"



def load_users_json(folder_path):
    
    # capture start time
    start_time = time.time()
    
    # Initialize an empty list to store the combined data
    users_data = []

    # Iterate through the files in the directory
    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path,filename)
        
        # print(f"LOG: Processing File {file_path}")
        
        # Load the JSON data from the file
        with open(file_path, 'r') as json_file:
            data = json.load(json_file)
        
        
        # flatten json data
        id = data['payload'].get('id')
        name = data['payload'].get('name')
        address = data['payload'].get('address')
        job = data['payload'].get('job')
        score = data['payload'].get('score')
        type = data['metadata'].get('type')
        event_id = data['metadata'].get('event_id')
        event_at = data['metadata'].get('event_at')
        
        # single user
        user = {'id':id, 'name':name, 'address':address, 'job':job, 'score':score,'type':type, 'event_id':event_id, 'event_at':event_at}
        
        # append each user
        users_data.append(user)
        
    # dump data into a csv file
    with open('users_data.json', 'w') as json_file:
        json.dump(users_data, json_file)
    
    # capture end time
    end_time = time.time()
    
    processing_time = end_time - start_time
    print(f"Users Data Stored Successfully at time execution {processing_time}")
    print(f"LOG:-> Processed {len(users_data)} users data.")

    return users_data



def load_cards_json(folder_path):
    
    # capture start time
    start_time = time.time()
    
    # Initialize an empty list to store the combined data
    cards_data = []

    # Iterate through the files in the directory
    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path,filename)
        
        # print(f"LOG: Processing File {file_path}")
        
        # Load the JSON data from the file
        with open(file_path, 'r') as json_file:
            data = json.load(json_file)
        
        # flatten json data
        id = data['payload'].get('id')
        user_id = data['payload'].get('user_id')
        created_by_name = data['payload'].get('created_by_name')
        updated_at = data['payload'].get('updated_at')
        created_at = data['payload'].get('created_at')
        active = data['payload'].get('active')
        type = data['metadata'].get('type')
        event_id = data['metadata'].get('event_id')
        event_at = data['metadata'].get('event_at')
        
    
        card = {'id':id, 'user_id':user_id, 'created_by_name':created_by_name, 'updated_at':updated_at, 'created_at':created_at,'active':active,'type':type, 'event_id':event_id, 'event_at':event_at}
        
        
        # append each card
        cards_data.append(card)
    
    # dump data into a json file
    with open('cards_data.json', 'w') as json_file:
        json.dump(cards_data, json_file)
        
    # capture end time
    end_time = time.time()
    
    processing_time = end_time - start_time
    print(f"Cards Data Stored Successfully at time execution {processing_time}")
    print(f"LOG:-> Processed {len(cards_data)} cards data.")
        
    return cards_data


# Function to process JSON files and write data to CSV
def process_json_to_csv(json_data, csv_filename):
    # Open the CSV file for writing
    with open(csv_filename, 'w', newline='') as csvfile:
        # Create a CSV writer object
        csv_writer = csv.writer(csvfile)

        # Write the header row
        header = json_data[0].keys()
        csv_writer.writerow(header)

        # Write the data rows
        for item in json_data:
            csv_writer.writerow(item.values())

    print(f"JSON data has been successfully converted to CSV and saved in {csv_filename}")





if  __name__ == "__main__":
    users_data = load_users_json(USERS_PATH)
    cards_data = load_cards_json(CARDS_PATH)
    
    process_json_to_csv(users_data, 'users_data.csv')
    process_json_to_csv(cards_data, 'cards_data.csv')