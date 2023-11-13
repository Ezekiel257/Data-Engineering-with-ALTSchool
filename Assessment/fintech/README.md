# Fintech Data Processing

This Python script processes JSON data from 'users' and 'cards' events in the fintech domain. It flattens the JSON structure, stores the data as JSON files, and converts it to CSV format.

## Prerequisites

- Python 3.x

## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/yourrepository.git
    ```

2. Navigate to the project directory:

    ```bash
    cd yourrepository
    ```

3. Install the required dependencies (if any):

    ```bash
    # Add installation command if needed
    ```

4. Run the script:

    ```bash
    python script.py
    ```

## File Structure

- `script.py`: Main Python script for processing 'users' and 'cards' JSON data.
- `users_data.json`: Processed and flattened 'users' data in JSON format.
- `cards_data.json`: Processed and flattened 'cards' data in JSON format.
- `users_data.csv`: Converted 'users' data in CSV format.
- `cards_data.csv`: Converted 'cards' data in CSV format.

## Functions

### `load_json_data(folder_path)`

- Loads JSON data from files in the specified folder.
- Flattens the JSON structure into a list of dictionaries.

### `store_data_as_json(data, output_filename)`

- Stores a list of dictionaries as a JSON file.

### `process_data_to_csv(data, csv_filename)`

- Writes a list of dictionaries to a CSV file.

### `main()`

- Entry point for the script.
- Calls functions to process 'users' and 'cards' data.

## Notes

- Adjust the folder paths in `ABSOLUTE_PATH`, `CARDS_PATH`, and `USERS_PATH` according to your directory structure.
- Customize the script as needed for specific JSON structures or additional processing steps.
- Consider implementing error handling for robustness.
