/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     February 7, 2023                      */
/*   Due Date:          February 13, 2023                     */
/*   Course:            CSC 136                               */
/*   Professor Name:    Dr. Zhang                             */
/*   Assignment:        #1                                    */
/*   Filename:          project1_MatthewMonn.cpp              */
/*   Purpose:           To input student data from another    */
/*                      file, read their names and scores into*/
/*                      array that is assigned as a struct,   */
/*                      then use functions to input, find     */
/*                      letter grades, highest score and then */
/*                      output.                               */
/**************************************************************/

#include <iostream>
#include <string>
#include <fstream>
#include <iomanip>
using namespace std;

struct studentType //struct for student data. 
{
  string studentFName; // student first name 
  string studentLName; // student last name 
  int testScore; // student numerical test score 
  char grade; //student letter grade score 
};

void readIn(studentType name[], ifstream &fp); //function prototypes 
void relevantGrade(studentType name[]);
int  highScore(studentType name[]);
void print(studentType name[], int highscore); 
int main()
{
  int highscore; //used to store the highest student grade score. 
  ifstream fp; 
  fp.open("studentData.txt"); //opens file needed in fstream. 
  if (!fp) //checker for if file doesnt open. 
    cout << "Error" << endl;
  
  studentType name[20]; //array for 20 students for association to struct.  
  readIn(name, fp); //function calls. 
  relevantGrade(name); 
  highscore = highScore(name);
  print(name, highscore);
  fp.close(); //closes file when file is completed. 
  
}
/********************************************************************/
/*   Function name:       readIn                                    */
/*   Description:         takes in file that was opened and stuct   */
/*                        with array and asssigns all the files     */
/*                        contents to the positions in the array    */
/*                        also using the struct.                    */
/*   Parameters:          studentType name[]: array to assign the   */
/*                        struct values from the file for student   */
/*                        data. ifstream &fp: takes in the file that*/ 
/*                        wass opened for student data.             */
/*   Return Value:        none, void function.                      */
/********************************************************************/

void readIn(studentType name[], ifstream  &fp)  
{
  for (int i = 0; i < 20; i++)
    {
      char e; //used to store /n character. 
      getline(fp, name[i].studentLName, ' '); //reads in last name. 
      getline(fp, name[i].studentFName, ' '); //reads in first name. 
      fp >> name[i].testScore; //reads in numerical test score. 
      fp.get(e); //reads in /n character. 
    }
}
/********************************************************************/
/*   Function name:       relevantGrade                             */
/*   Description:         takes the array in to compared the scores */
/*                        for correct letter grades in output       */
/*                        It also associates the letter score to    */
/*                        char grade in the struct.                 */
/*   Parameters:          studentType name[]: taken in to find and  */ 
/*                        compared the scores to get a letter grade.*/
/*   Return Value:        none, void function.                      */
/********************************************************************/
void relevantGrade(studentType name[])
{
  
  for ( int i = 0; i < 20; i++) //finds the letter grade with for loop containing if statements for comparison. 
    {
      if (name[i].testScore >= 90)
	name[i].grade = 'A';
      else if (name[i].testScore >= 80)
	name[i].grade = 'B';
      else if (name[i].testScore >= 70)
	name[i].grade = 'C';
      else if (name[i].testScore >= 60)
	name[i].grade = 'D';
      else if (name[i].testScore < 60)
	name[i].grade = 'F';
      else
	cout << "error"; //checker for errors. 
    }
}
/********************************************************************/
/*   Function name:       highScore                                 */
/*   Description:         takes the array in and uses a for loop to */
/*                        run through the entire array to find and  */
/*                        compare the scores to find the highest.   */
/*                        assigns the highest to a new variable     */
/*   Parameters:          studentType name[]: taken in for the      */
/*                        student grades to find the highest.       */
/*   Return Value:        int, returns highest score in high.       */
/********************************************************************/
int highScore(studentType name[])
{
  int high; //stores highest variable in function. 
  for (int i = 0; i < 20; i++)
    {
      if (name[i].testScore > high) //comparing 
	high = name[i].testScore;
    }
  return high; //returns the highest grade. 
}
/********************************************************************/
/*   Function name:       print                                     */
/*   Description:         takes the array and highest score to      */
/*                        outprint the data how the project needs to*/
/*                        be outprinted using for loops.            */
/*   Parameters:          studentType name[]: brought in for the    */
/*                        final time to outprint the data stored.   */
/*                        int highscore: contains the highest score */
/*                        for outprint and identifying the students */
/*                        with that score.                          */
/*   Return Value:        none, void function.                      */
/********************************************************************/
void print(studentType name[], int highscore) 
{
  cout << "Student Name" << setw(15) << "Test Score" << setw(7) << " Grade" << endl; //beginning of output. 
  for ( int i = 0; i < 20; i++) //runs for loop to outprint every student data in position of array. 
    {
      cout << setw(22) << left << name[i].studentFName +  ", " +  name[i].studentLName << " " << right <<  name[i].testScore << " " << setw(6) <<  name[i].grade  << endl;  
    }
  cout << endl; 
  cout << "Highest Test Score: " << highscore << endl; //highest test score printed. 
  cout << endl;
  cout << "Students having the highest test score: " << endl; 
  for (int i = 0; i < 20; i++) //outprints the students who obtained the highest test score above with their first and last names. 
    {
      if (name[i].testScore == highscore)
	cout << name[i].studentFName << ", "  << name[i].studentLName << endl; 
    }
} 
   
