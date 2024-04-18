import requests 

class WeatherAPICity:
    
    def __init__(self, CityInput,ResponseJSON,Response): 
        self.CityInput = CityInput
        self.ResponseJSON = ResponseJSON
        
    def RequestCityCurrentWeather(self): 
        Response = requests.get("http://api.weatherapi.com/v1/current.json?key=cff5f2a2a125471dadf01403241104&q={}".format(self.CityInput))
 
        if Response.status_code == 200:
            print("HTTP Status Code:" , Response.status_code,'\n')
            self.ResponseJSON = Response.json()
        else:
            print("Failed to retrieve weather data. HTTP Status Code:", self.Response.status_code)
        
        
    def printMenu(self):
        self.Div() 
        print("Welcome to the terminal based weather application menu.")
        print("Information obtained is from https://www.weatherapi.com.") 
        self.Div() 
        print("City: ",self.ResponseJSON['location']['name'])
        print("Region: ",self.ResponseJSON['location']['region'])
        print("Country: " ,self.ResponseJSON['location']['country'])
        print("Last Updated: ",self.ResponseJSON['current']['last_updated'])
        self.Div()
        while True:
            print("What information based in",self.ResponseJSON['location']['name'],"are you looking for?")
            print("1: Latitude and longitude of area.")
            print("2: Local time.")
            print("3: Wind data.")
            print("4: Pressure.")
            print("5: Weather condition.")
            print("6: Temperature.")
            print("7: Precipitation.")
            print("8: Humidity.")
            print("9: UV index.")
            print("10: Day or night.")
            print("11: Change City.")
            print("12: Quit.")
            self.Div()
            MenuChoice = input("[1-12]: ")
            if MenuChoice == "1": 
                self.LatLong() 
            elif MenuChoice == "2": 
                self.LocalTime()
            elif MenuChoice == "3":
                self.WindData()
            elif MenuChoice == "4":
                self.Pressure()
            elif MenuChoice == "5":
                self.WeatherConditon()
            elif MenuChoice == "12":
                print("Quitting Program.")
                self.Div()
                break; 
            else: 
                self.Div()
                print("Invalid input.")
                self.Div()
                
            #print(self.ResponseJSON)
            
    
    def LatLong(self): 
        self.Div() 
        print("Latitude in decimal degree: ", self.ResponseJSON['location']['lat']) 
        print("Longitude in decimal degree: ", self.ResponseJSON['location']['lon'],"\n")
        self.Div()
        
    def LocalTime(self):    
        self.Div()
        print("Local time: ", self.ResponseJSON['location']['localtime'])
        print("Local date and time (unix time): ",self.ResponseJSON['location']['localtime_epoch'])
        print("Time zone name: ",self.ResponseJSON['location']['tz_id'])
        self.Div()
    def WindData(self):
        self.Div()
        print("Wind mph: ", self.ResponseJSON['current']['wind_mph'])
        print("Wind kph: ", self.ResponseJSON['current']['wind_kph'])
        print("Wind degree: ", self.ResponseJSON['current']['wind_degree'])
        print("Wind direction: ", self.ResponseJSON['current']['wind_dir'])
        self.Div()

    def Pressure(self):
        self.Div()
        print("Pressure in millibars: ", self.ResponseJSON['current']['pressure_mb'])
        print("Pressure in inches: ", self.ResponseJSON['current']['pressure_in'])
        self.Div()

    def WeatherConditon(self):
        self.Div()
        print("Weather condition: ", self.ResponseJSON['current']['condition']['text'])
        print("Condition icon: ", self.ResponseJSON['current']['condition']['icon'])
        print("Condition weather code: ", self.ResponseJSON['current']['condition']['code'])
        self.Div()

    def Div(self): 
        equals = f"{'='*50}"
        print(equals)