import requests
from CurrentWeather import currentWeather

def main():
    print("Welcome to the terminal based weather application menu.")
    print("Information obtained is from https://www.weatherapi.com.")
    print("1: Current Weather.")
    print("2: Forecast.")
    print("3: Exit. \n")

    while True:
        Choice = input("Input: ")
        if Choice == "1":
            print("Enter below either a Latitude & Longitude by format (Lat,Long) , city name , US zip code, UK postcode , ")
            print("Canada postal code , metar by format (metar:<metar code>) , iata by format (iata:<3 digit airport code) ,  ")
            print("IP lookup by format (auto:ip) , or IP address(IPv4 and IPv6 supported) \n")
            while True:
                Input = input("Input: ")
                print("API communicating with the city's current weather... \n")

                CurrentAPI = currentWeather(Input, None, None)
                CurrentAPI.RequestCityCurrentWeather()
                if CurrentAPI.ResponseJSON is not None:
                    break  # Break the loop if the input is valid
                else:
                    print("Invalid input. Please retry.\n")
            CurrentAPI.printMenu()
            break;
        elif Choice == "2":
            print("Test")
        elif Choice == "3":
            print("Bye.")
            return
        else:
            print("Invalid Input \n")

    
if __name__ == "__main__":
    main()
 





