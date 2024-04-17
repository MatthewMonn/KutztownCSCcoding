import requests
from WeatherAPIClass import WeatherAPICity

def main(): 
    CityInput = input("What city would you like to see the current weather? \n")
    print("API communicating with the city's current weather... \n")

    City_API = WeatherAPICity(CityInput, None, None) 
    City_API.RequestCityCurrentWeather()
    City_API.printMenu() 
    
if __name__ == "__main__":
    main()
 


