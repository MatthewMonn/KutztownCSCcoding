"""
#
#  Author:           Matthew Monn 
#  Creation Date:    February 9, 2023
#  Due Date:         February, 14, 2023
#  Course:           CSC223 
#  Professor Name:   Dr. Carelli 
#  Assignment:       #2 
#  Filename:         dinner.py 
#
#  Purpose:        
#    To input a file with the price of each person, put into lists, 
#    then dictionary, and calculate the tax, tip, and group total for output on a formatted table.
#
"""

"""
#
#  Function name: main 
#  Description: runs all the function calls and connection pieces.
#  Parameters: none 
#  Return Value: none 
"""

def main():
    fname= input("Enter the file name: ")
    listsoflist = readData(fname) #functions calls 
    listsdict = computeBill(listsoflist)
    writeFile(listsdict) 
    




"""
#
#  Function name:    readData 
#  Description:      take in file data after user is prompted, and then stores into a list of lists. 
#  Parameters:       string  fname - stores the user input to identify the file name to open such file for data (input) 
#  Return Value:     float list allLines - stores the float values of the total per person from the input file.  
#
"""

def readData(fname):
    fobj= open(fname,'r') #opens file
    allLines = [] #list for input 
    line = fobj.readline() 
    while bool(line): #while loop for storing data into list, also turning into floats. 
        line= line.strip() 
        toks= line.split()
        toks = [float(x) for x in toks]
        allLines.append(toks)
        line = fobj.readline()
    return allLines 
    
"""
#
#  Function name:    getTip
#  Description:      calculates the tip amount from the value from the instructions. 
#  Parameters:       int totalpeople- used to calculate the percent tip. (input)
#                    float summation - used to calculate the individual lists sums for each table. (input)  
#                    
#  Return Value:     float - tip is returned for the calculation in function computeBill. 
#
"""

def getTip(totalpeople,summation): 
    if totalpeople < 6: #if statements to determine tip calculation and percentage.
        tip = summation * 0.20
        return(tip)
    elif totalpeople >= 6:
        tip = summation * 0.20
        return(tip)
    else:
        print('error')
"""
#
#  Function name:    computeBill 
#  Description:      Computes the total for every calculation for the final dictionary for table output, also stores into a lists of dictionaries. 
#  Parameters:       float listsoflist - carries data from orginial input to calculate into dictionary.(input) 
#  Return Value:     float list dictionary - stores a list of dictionaries for output table. 
#
"""

def computeBill(listsoflist): 
    dictionary = [] #list for dictionaries 
    for h in listsoflist:
        totalpeople = len(h) #total people calculation 
        summation = sum(h) #sum of each table calculation 
        tip = getTip(totalpeople,summation) #function call for tip
        tax = summation * 0.06;
        groupTotal = summation + tax + tip
        listsdict = { #dictionary 
            'SubTotal': summation,
            'Tip' : tip,
            'Tax': tax,
            'Total' : groupTotal
        }
        dictionary.append(listsdict) #adds dictionaries to list. 
    return dictionary

"""
#
#  Function name:    writeFile
#  Description:      takes in the list of dictionaries to output in a neat table.  
#  Parameters:       float listsdict - list of dictionaries (input) 
#  Return Value:     none
#
"""

def writeFile(listsdict):
    fileC = open("out.dat","w") #opens output file 
    fileC.write('{:^31}'.format('Total Charges per Group') + '\n') #
    fileC.write("SubTotal")
    fileC.write('{:>7}'.format("Tax"))
    fileC.write('{:>8}'.format("Tip"))
    fileC.write('{:>8}'.format("Total") + '\n')
    fileC.write('{:->33}'.format('') + '\n')
    for dictz in listsdict: #for loop for output of variables. 
        fileC.write(" ${:>6.2f}".format(dictz.get('SubTotal'), end = "")),
        fileC.write(" ${:>6.2f}".format(dictz.get('Tax'), end = "")),
        fileC.write(" ${:>6.2f}".format(dictz.get('Tip'), end = "")),
        fileC.write(" ${:>6.2f}".format(dictz.get('Total')))
        fileC.write('\n')
        
main()
