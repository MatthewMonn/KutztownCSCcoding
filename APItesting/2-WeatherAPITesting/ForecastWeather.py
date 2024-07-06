import requests
from Weather import Weather

class ForecastWeather(Weather):
    def __init__(self,Input, ResponseJSON, Response):
        self.Input = Input
        self.ResponseJSON = ResponseJSON

    def RequestForecastWeather(self):
        Response = requests.get("http://api.weatherapi.com/v1/forecast.json?key=cff5f2a2a125471dadf01403241104&q={}&days=3".format(self.Input))

        if Response.status_code == 200:
            print("HTTP Status Code:", Response.status_code, '\n')
            self.ResponseJSON = Response.json()
        else:
            return

    def printMenu(self):
        self.Div()
        print("City: ", self.ResponseJSON['location']['name'])
        print("Region: ", self.ResponseJSON['location']['region'])
        print("Country: ", self.ResponseJSON['location']['country'])
        print("Last Updated: ", self.ResponseJSON['current']['last_updated'])
        self.Div()
        while True:
            print("What information based in", self.ResponseJSON['location']['name'], "are you looking for?")

            break;

    def Div(self):
        equals = f"{'=' * 50}"
        print(equals)