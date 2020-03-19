# Import the pathlib and csv library
from pathlib import Path
import csv

# Set the file path
dir_path = Path(__file__).parents[2]
file_path = f"{dir_path}/VU-NSH-FIN-PT-02-2020-U-C/02-Python/Homework/Instructions/PyRamen/Resources/menu_data.csv"

# Initialize menu list
menu_list = []

# Open the input path as a file object
with open(csvpath, 'r') as csvfile:

    # Print the datatype of the file object
    print(type(csvfile))

    