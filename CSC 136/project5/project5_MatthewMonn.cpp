#include "linkedList.h"
#include <iostream>
#include <string>

using namespace std;

int main()
{
  bool check = false; //to check for the case of no vowels or number case. 
  string Pig; //input from user. 
  cout << "Enter a string: ";
  cin >> Pig;
  cout << endl; 
  cout << "The string you entered is: " << Pig << endl;
  linkedListType<char> charList; //linked list for characters of the input string. 
  for(int i = 0; i < Pig.length(); i++)
    { 
      charList.insertLast(Pig[i]); //inserts the string into a char linked list. 
    }
  if (charList.search('A')) //big if statement using the search function to find vowels. 
    check = true;
  else if (charList.search('a'))
    check = true;
  else if (charList.search('E'))
    check = true;
  else if (charList.search('e'))
    check = true;
  else if (charList.search('I'))
    check = true;
  else if (charList.search('i'))
    check = true;
  else if (charList.search('O'))
    check = true;
  else if (charList.search('o'))
    check = true;
  else if (charList.search('U'))
    check = true;
  else if (charList.search('u'))
    check = true;
  else if (charList.search('Y'))
    check = true;
  else if (charList.search('y'))
    check = true;
  else
    check = false; 
  
  linkedListIterator<char> pigChar; //used to switch input from characters to single word for output. 
  string result; 
  if (charList.front() == 'A' || charList.front() == 'a' || charList.front() == 'E' || charList.front() == 'e' || charList.front() == 'I' || charList.front() == 'i' || charList.front() == 'O' || charList.front() == 'o' || charList.front() == 'U' || charList.front() == 'u' || charList.front() == 'Y' || charList.front() == 'y') //first case for pig latin to check if vowel is starting letter. 
    { 
      charList.insertLast('-'); 
      charList.insertLast('w');
      charList.insertLast('a');
      charList.insertLast('y');
      pigChar = charList.begin(); 
      for ( int i = 0; i < charList.length(); i++)
	{
	  result += *pigChar; //switches the characters of linked list and inputs together in output string variable. 
	  ++pigChar; 
	}
      
      cout << "The pig Latin form of the string: " << result << endl;
    }
  else if (check == false) //case if no vowels are present in the input. 
    {
      charList.insertLast('-');
      charList.insertLast('w');
      charList.insertLast('a');
      charList.insertLast('y');
      pigChar = charList.begin();
      for ( int i = 0; i < charList.length(); i++)
	{
	  result += *pigChar;
	  ++pigChar;
	}
      
      cout << "The pig Latin form of the string: " << result << endl;
      
    }
  else  //case if vowel isnt in the first character of string input but is later on in the string. 
    {
      charList.insertLast('-'); 
      while(charList.front() != 'A' || charList.front() != 'a' || charList.front() != 'E' || charList.front() != 'e' || charList.front() != 'I' || charList.front() != 'i' || charList.front() != 'O' || charList.front() != 'o' || charList.front() != 'U' || charList.front() != 'u' || charList.front() != 'Y' || charList.front() != 'y')
	{ 
	  charList.rotate(); //rotates the linked list to follow pig latin rules. 
	  if (charList.front() == 'A' || charList.front() == 'a' || charList.front() == 'E' || charList.front() == 'e' || charList.front() == 'I' || charList.front() == 'i' || charList.front() == 'O' || charList.front() == 'o' || charList.front() == 'U' || charList.front() == 'u' || charList.front() == 'Y' || charList.front() == 'y')
	    {
	      break;
	    }
	}
      charList.insertLast('a');
      charList.insertLast('y');
      pigChar = charList.begin();
      for ( int i = 0; i < charList.length(); i++)
	{
	  result += *pigChar;
	  ++pigChar;
	}
      cout << "The pig Latin form of the string: " << result << endl;    
    }
  
  
}
