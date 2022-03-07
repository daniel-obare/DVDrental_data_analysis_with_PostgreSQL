-- GCP Cloud Function to write data to BigQuery

from google.cloud import bigquery
import pandas as pd

client = bigquery.Client()
table_id = "[PROJECT-ID].[DATASET].[TABLE]"

def download_data(request):

     df = pd.read_csv('https://covid.ourworldindata.org/data/ecdc/full_data.csv')

    --  # Create an empty list 
     Row_list =[] 

    --  # Iterate over each row 
     for index, rows in df.iterrows(): 
          -- # Create list for the current row 
          my_list =(rows.date, rows.location, rows.new_cases, rows.new_deaths, rows.total_cases, rows.total_deaths)  
          -- # append the list to the final list 
          Row_list.append(my_list) 


    --  ## Get Biq Query Set up
     table = client.get_table(table_id)

     errors = client.insert_rows(table, Row_list)  # Make an API request.
     if errors == []:
          print("New rows have been added.")