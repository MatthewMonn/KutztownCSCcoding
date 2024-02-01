/*************************************************************/
/*   Author:            Matthew Monn                         */
/*   Major:             Computer Science                     */
/*   Creation Date:     February 23 2023                     */
/*   Due Date:          February 27, 2023                    */
/*   Course:            CSC 136                              */
/*   Professor Name:    Dr. Zhang                            */
/*   Assignment:        #2                                   */
/*   Filename:          project2_MatthewMonn.cpp             */
/*   Purpose:           To create a menu driven book library */
/*                      that utilizes a class to create      */                      
/*                      different options available to the   */
/*                      user. reads in a file of books to    */
/*                      create a list of those books.        */
/*                                                           */
/*************************************************************/
#include <iomanip>
#include <iostream>
#include <fstream>
#include <string>
#include "bookType.h"
using namespace std;

int main()
{
  bookType books[100]; //stores information of up to 100 books, using only 5 in file. 
  ifstream fp;
  bool out; 
  bool c;
  int numberofBooks; //total number of books in file.
  char ch; //grabs newline. 
  string s, input = ""; 
  string title;
  string ISBN;
  string Publisher;
  int PublishYear;
  string auth[4];//array used to store the authors of each book for input.
  double cost; //cost of each book.
  int copies; //number of copies of the book. 
  int authorCount = 0; //used to find how many authors for each book for auth array.
  int choice = 0; //used to start the switch case for choices. 
  int addBooks; // changes the amount of quantity of books. 
  int a; 
  fp.open("bookData.txt"); //file open. 
  fp >> numberofBooks;
  fp.get(ch);
  
  cout << "Welcome To Rock's Book Store" << endl; //beginning of menu. 
  cout << setfill('-') << setw(58);
  cout << "\n1: Print a list of books " << endl;
  cout << "2: Print a list of books and ISBN numbers " << endl;
  cout << "3: To search a book by ISBN " << endl;
  cout << "4: To update the number of copies of a book " << endl;
  cout << "5: To print books data " << endl;
  cout << "6: Exit the program. " << endl;
  cout << "Enter your choice [1-6]: ";
  cin >> choice; //user input. 
  
  for (int i = 0; i < numberofBooks; i++) //for loop used to store the input file of the five books. 
    {
      getline(fp, title);
      getline(fp,ISBN);
      getline(fp,Publisher);
      fp >> PublishYear >> cost >> copies >> authorCount;
      fp.get(ch);
      
      for (int j = 0; j < authorCount; j++)//author array storing up to 4 authors as defined by authorCount variable. 
	{
	  getline(fp, auth[j]);
	}
      

      books[i].setBookInfo(title, ISBN, Publisher, PublishYear, auth, cost, copies, authorCount); //calls the function of setBookInfo that inputs the local variables into private variables in class.
    }
  while (choice != 6) //loops until a 6 is inputed as choice 6 exits program. 
    {
      bool countz = false; 
      switch (choice) {
      case 1:
	cout << "================================\n";
	for (int i = 0; i < numberofBooks; i++)
	  {
	    books[i].printbookTitle(); //calls function to outprint the info in a neat order.
	  }
	
	cout << "================================\n";
	break;
	
      case 2:
	cout << "================================\n";
	for (int i = 0; i <numberofBooks; i++)
	  {
            books[i].printbookTitleAndISBN(); //title and isbn is printed through this function for choice 2.
	  }
        cout << "================================\n";
	break;
	
      case 3: 
	cout << "Enter the ISBN of the book: "; //asks for user to input the isbn for specific book call. 
	cin >> input;
	for (int i = 0; i < numberofBooks; i++)
	  {
	    books[i].getBookISBN(s); //compares the user input to each isbn stored in the private variables as it runs for loop.
	    
	    if (input == s) //if the user input matches isbn number, it prints out the specific book. 
		{
		  cout << "=======================================\n";
		  books[i].printInfo(); //prints info of the one book.
		  cout << "=======================================\n";
		  countz = true; //counter so it doesn't initiate the error message. 
		}
	  }
	if (countz == false) //error message if user input doesn't match an ISBN. 
	  cout << "The store does not sell this book. " << endl; 
	break;
	  
      case 4:
	cout << "Enter the ISBN of the book: "; //asks for user to input the isbn for specific book call.
        cin >> input;
	for (int i = 0; i < numberofBooks; i++) //same process as choice 3. 
          {
            books[i].getBookISBN(s); 
	    
	    if (input == s)
	      {
		cout << "=======================================\n";
		books[i].printInfo(); //prints info of the one book.
		cout << "=======================================\n";
		countz = true;
		a = i; //takes the number position of the matching ISBN to use for updating the quantity. 
	      }
          }
        if (countz == false) 
          cout << "The store does not sell this book. " << endl;
	else
	  {
	    cout << "Enter the number of books: ";
	    cin >> addBooks; //number to change quantity of book from user input. 
	    cout << endl;
	    cout << "=======================================\n";
	    books[a].updateQuantity(addBooks); //functions adds user int to private quantity. 
	    books[a].printInfo(); //prints book with new quantity info. 
	    cout << "=======================================\n";
	  }
	break;
	
      case 5:
	
	for (int i = 0; i < numberofBooks; i++)
	  {
	    cout << endl; 
	    books[i].printInfo(); //prints all books for choice 5 request through for loop.
	    cout << "---------------------------------\n";
	  }
	break;
	
      default: //if 1-6 isn't the choice, it will outprint an error message. 
	cout << "Invalid selection" << endl;
      }
      cout << "Enter your choice [1-6]: "; //gives user another chance for correct input. 
      cin >> choice;
    }
  
  fp.close(); //closes the file.
  
}
  
