#Library for working with dataframes
import pandas as pd
#Library for the Socrata Open Data API
from sodapy import Socrata
#Library for converting Zip Codes to their associated states 
from pyzipcode import ZipCodeDatabase

#Retrieves website 
client = Socrata("data.cityofnewyork.us", None)

#First 3,000,000 results, returned as JSON from API / converted to Python list of dictionaries by sodapy
results = client.get("h9gi-nx95", limit=3000000)

#Convert to pandas DataFrame
results_df = pd.DataFrame.from_records(results)

#Retrieves column names and column index, to check if the correct columns were retrieved  
count = -1
for x in results_df.columns.values:
    count += 1
    print(x + " " + str(count))

#Deletes unecessary columns
results_df = results_df.drop(results_df.columns[[2, 3, 4, 5,6, 7,8, 9, 10, 11, 17, 19, 20, 22]], axis=1)

#Checking if any of the rows having missing values or 
results_df.notnull()

#Removing rows with missing values
results_df.dropna(inplace=True)

#Reformatting date column 
for x in results_df["crash_date"]:
    results_df["crash_date"].replace(x,x.strip("T00:00:00.000"), inplace= True)

#Adding state column based on zipcodes
#Calls Zip Code Databse
zcdb = ZipCodeDatabase()
#Creates a new state column and maps each zipcode to it's associated state
results_df["state"] = results_df["zip_code"].map(lambda x: zcdb[x].state)

#Filtering rows by year 2016
filter_crash_date = ["2016"]
mask = results_df["crash_date"].isin(filter_crash_date)
results_df.loc[mask,"crash_date"]

#Filtering by states that belong in MD, DC, VA
filter_state = ["MD","DC","NY"]
mask2 = results_df["state"].isin(filter_state)
results_df.loc[mask2,"state"]

#Transfers data from dataframe to CSV file
results_df.to_csv('motor_vehicle_collisions.csv')

