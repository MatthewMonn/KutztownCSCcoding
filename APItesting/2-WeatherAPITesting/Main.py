import requests
from WeatherAPIClass import WeatherAPICity

def main():
    print("Welcome to the terminal based weather application menu.")
    print("Information obtained is from https://www.weatherapi.com.")
    print("Enter below either a Latitude & Longitude by format (Lat,Long) , city name , US zip code, UK postcode , ")
    print("Canada postal code , metar by format (metar:<metar code>) , iata by format (iata:<3 digit airport code) ,  ")
    print("IP lookup by format (auto:ip) , or IP address(IPv4 and IPv6 supported) \n")
    while True:
        Input = input("Input: ")
        print("API communicating with the city's current weather... \n")

        City_API = WeatherAPICity(Input, None, None)
        City_API.RequestCityCurrentWeather()
        if City_API.ResponseJSON is not None:
            break  # Break the loop if the input is valid
        else:
            print("Invalid input. Please retry.\n")
    City_API.printMenu()
    
if __name__ == "__main__":
    main()
 





