import requests
url = "https://firms.modaps.eosdis.nasa.gov/api/country/csv/ddb2bd2d4d409c7188635b1fa0b23b9d/VIIRS_SNPP_NRT/KAZ/1/2023-10-07"

response = requests.get(url)
csv_data = response.text.splitlines()
    
for row in csv_data[1:]:
    data = row.split(',')
    print(data)