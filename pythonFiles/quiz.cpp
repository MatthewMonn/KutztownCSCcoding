/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     January 24, 2023                      */
/*   Due Date:          January 31, 2023                      */
/*   Course:            CSC_223_020                           */
/*   Professor Name:    Dr. Carelli                           */
/*   Assignment:        #1 Prerequisites                      */
/*   Filename:          quiz.cpp                              */
/*   Purpose:           To input quiz grades from a file and  */
/*                      calculate a percentage grade using    */
/*                      basic coding knowledge.               */
/**************************************************************/

#include <iostream>
#include <string>
#include <fstream>
#include <iomanip>
using namespace std;

void output(string,int&,string[],string[]); //function protoype for ressults table. 

int main()
{
  float results;
  ifstream fp;
  string names, grade, file;
  int counter = 0; 
  string grades[20], answers[20];  
  cout << fixed << setprecision(1); //creates one decimal place.  
  cout << "Enter the name of the file: "<< endl; //user input file cin. 
  cin >> file;
  
  fp.open(file.c_str()); //opening of such file in directory. 
  
  if (!fp) //checking for error opening file to exit gracefully. 
    {
      cout << "File error" << endl;
      return 0;  
    }
  
  getline(fp, names, ' ');
  
  if (names != "answers") //if first name isnt answers, file will exit gracefully. 
    {
      cout << "End" << endl;
      return 0;
    }
  
  for (int i = 0; i < 19; i++) //first for loop to store answer key array. 
    {  
      getline(fp, grade, ' '); 
      answers[i] = grade;
    }
  
  getline(fp, grade); //used to store the last piece of the array so that only a multiple choice answer is selected and not the next name on the next line. 
  answers[19] = grade; 
  cout << "Student" << setw(11) << "Grade" << endl; //heading for the table.  
  cout << "------------------------" << endl;
  while (getline(fp, names, ' ')) //while loop used to go through all names until no name is left. 
    { 
      for (int i = 0; i < 19; i++) //second for loop to store student choice of answers. 
	{
	  getline(fp, grade, ' ');
	  grades[i] = grade;
	  if (grades[i] == answers[i]) // if the multiple choice answer is the same as the answer key, counter will go up to count how many are correct. 
	    counter++;
	}
      getline(fp, grade); //stores the last multiple choice answer without a name connected to it. 
      grades[19] = grade;
      output(names, counter, grades, answers); //function call for output. 
    }
  
}

/********************************************************************/
/*   Function name:       output                                    */
/*   Description:         takes in the counter, answer key array,   */ 
/*                        student grade array, and names to output  */
/*                        a nicely formatted table for the students */
/*                        percentage that they got correct.         */
/*   Parameters:          string grades[]: array for student        */
/*                        multiple choice answers- input.           */
/*                        string answers[]: array for answer key-   */
/*                        input.                                    */
/*                        int& counter: counter that is passed in   */
/*                        and out to determine how many the student */
/*                        got correct.-input                        */
/*                        string names: names of the student for    */
/*                        output in table.-input                    */
/*   Return Value:        none, void function.                      */
/********************************************************************/

void output(string names, int& counter, string grades[],string answers[]) 
{
  float calculation;
  if (grades[19] == answers[19]) //compares the last choice of answer to see if correct. 
    counter++;
  calculation = counter * 100 / 20; // equation for calculating the percentage of how many the student got correct. 
  cout << left << setw(10) << names << right << setw(7) << calculation << "%" << endl; //output of names, grade, and percentage symbol in a nice order. 
  counter = 0; //resets counter for next student. 
}
