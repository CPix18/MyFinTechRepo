# Import the pathlib and csv library
from pathlib import Path
import csv

# Set the file path
dir_path = Path(__file__).parents[1]
file_path = f"{dir_path}/PyRamen/Resources/menu_data.csv"
for path in Path(__file__).parents:
    print(path)

# Initialize menu list
menu_list = []

# Open the input path as a file object
with open(file_path, 'r') as csvfile:

    # Print the datatype of the file object
    print(type(csvfile))

    