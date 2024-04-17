import requests

response = requests.get("http://randomfox.ca/floof")
print(response.status_code) #returns html code for status. 
#print(response.text()) #prints a string of raw data that is extracted.
#print(response.json()) #prints an acutal dicionary to work with. 
fox = response.json()
print(fox['image']) #looks for image key and prints out value. 
