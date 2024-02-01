//include necessary header files
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main()
{
  //you should declare an array of bookType
  //bookType books[100]; 

  ifstream fp;

  
  int numberofBooks;
  char ch;
  
  string title;
  string ISBN;
  string Publisher;
  int PublishYear;
  string auth[4];
  double cost;
  int copies;
  int authorCount;

  //open file
  fp.open("bookData.txt");

  //read the first number into numberofBooks
  fp >> numberofBooks;
  
  fp.get(ch);  //get rid of \n

  //set up a loop to read in information about each book
  for (int i = 0; i < numberofBooks; i++)
    {
        getline(fp, title);
        getline(fp,ISBN);
        getline(fp,Publisher);
        fp >> PublishYear >> cost >> copies >> authorCount;
        fp.get(ch);

        for (int j = 0; j < authorCount; j++)
            getline(fp, auth[j]);


	//for testing purposes, you should remove this part later
	cout << "================================\n";
	cout << title << endl;
	cout << ISBN << endl;
	cout << Publisher << endl;
	cout << PublishYear << endl;
	cout << cost << endl;
	cout << copies << endl;
	for (int j = 0; j < authorCount; j++)
	  cout << auth[j] << endl;
	cout << "================================\n\n";
		
	//use the setBookInfo method to insert the information
	//into your book object

    }

  //close the file
  fp.close();

  



}
