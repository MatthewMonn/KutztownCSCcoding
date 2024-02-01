"""
#
#  Author:           Matthew Monn 
#  Creation Date:    February 25, 2023 
#  Due Date:         February 28, 2023 
#  Course:           CSC223 
#  Professor Name:   Dr. Carelli 
#  Assignment:       #3 
#  Filename:         tvshows.py  
#
#  Purpose:        
#     This program will ask the user 
#     to input a csv file of tv shows
#     and outprint a table of tv 
#     shows between 2018-2020, number
#     of pre 1970 shows, pre-1970 kid 
#     friend shows in a neat table. 
#     Then, write to a json file for 
#     the pre-1970 kid friendly shows. 
"""
import csv
def main():
    lists = [] 
    counter1 = 0
    counter2 = 0
    counter3 = 0
    counter4 = 0
    bkids = [] 
    try:
    
       fname= input("Enter the file name: ")
       open(fname, 'r')#user inputted file. 
    except:
        print('Error opening file') #error check. 
        exit()

    head = ["Title", "Year","Age"] #for dictionary association. 
    listV = []
    DictList = []
    
    with open(fname, mode = 'r') as csvfile:
        reader = csv.reader(csvfile) #properly read the csv file. 
        for row in reader:
            listV = list(reader) #stores each line/row into a list. 
        
        for x in listV:
            temp = x
            for i in range(3):
                tempDict = {head[i]:temp[i] for i in range(3)} #takes the list and associates to a dictionary and appends them as a list of dictionaries. 
            DictList.append(tempDict)
    
    outprintShowsTable(counter1,counter2,counter3,DictList) #function calls. 
    x = outprint1970s(counter4,DictList,bkids)
    json(x)
"""
#
#  Function name:    outprintShowsTable 
#  Description:      inputs the dictionary list, counters 
#                    the years that the table wants(2018,
#                    2019. 2020), and outprints them in a
#                    neat table. 
#  Parameters:       int counter1 - counter for 2018 (input)
#                    int counter2 - counter for 2019 (input)
#                    int counter3 - counter for 2020 (input)
#  Return Value:     none - nothing returned. 
#
"""

def outprintShowsTable(counter1,counter2,counter3,DictList):
    j = [sub["Year"] for sub in DictList] #dictionary comprehension. 
    for x in j:
        if x == "2018": #checks for those years in the list of dictionary, adds counter if true. 
            counter1 += 1
        if x == "2019":
            counter2 += 1
        if x == "2020":
            counter3 += 1
    
    print("{:<5} {:<5}".format("Year","#Shows")) #neat table. 
    print("{:->12}".format("-"))
    print("{:<6} {:<6}".format("2018",counter1))
    print("{:<6} {:<6}".format("2019",counter2))
    print("{:<6} {:<6}".format("2020",counter3))
    
"""
#
#  Function name:    outprint1970s 
#  Description:      Calculate total owed for a stay in the hospital.
#  Parameters:       int num_days - days in hospital (input)
#                    char room_type - type of room (input)
#  Return Value:     bkids: list of dictionaries of the pre 1970
#                    tv shows. 
"""

def outprint1970s(counter4,DictList,bkids):
    dkids = []
    temp3 = 0
    for x in DictList:
        temp = x
        if int(temp.get('Year')) < 1970: #grabs the year and assocites to new list of dictionaries with only pre 1970 shows. 
            dict3 = {
                "Title": temp.get('Title'),
                "Year": temp.get('Year'),
                "Age": temp.get('Age')
            }
            bkids.append(dict3)
    for z in bkids:
        s = z
        counter4 += 1
    
        if int(s.get('Age')) == 7: #checks for 7 for kid friendly. 
            count = filter(lambda x: 'Age'  == 7, bkids)
            temp3 = s.get('Title')
            dkids.append(temp3) #appends the dictionary names for table. 
        
    print("Number of pre-1970 shows: ",counter4,'\n')

    print("pre-1970 kid friendly shows")
    print("{:->27}".format("-")) 
    dkids.sort()
    for t in dkids:
        print(t)
        
    return bkids

"""
#
#  Function name:    json
#  Description:      takes the pre 1970 shows and prints it
#                    neatly into a json file.  
#  Parameters:       list x - list containing the pre 1970
#                    shows. (input)
#  Return Value:     none- nothing returned. 
"""

def json(x):
    import json
    js = json.dumps(x, indent = 2)
    newline = open( "tvshows.json", 'w')
    newline.write(js) 






    
main()
