/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     December 9,  2023                     */
/*   Due Date:          December 12, 2023                     */
/*   Course:            CSC 237                               */
/*   Professor Name:    Dr. Zhang                             */
/*   Assignment:        #6                                    */
/*   Filename:          project6.cpp                          */
/*   Purpose:           To create a hash table to contain     */
/*                      49k+ words to spell check what the    */
/*                      user entered and generate corrections */ 
/*                      if available in a neat matter.        */ 
/**************************************************************/

#include <iostream>
#include <fstream>
#include "QuadraticProbing.h"
#include <string>
#include <vector>
#include <algorithm>
#include <set>

using namespace std;


vector<string> gencorrections(const string &word); //function prototype.

int main()
{
  ifstream fp; 
  cout << "Initializing the hash table ..." << endl; //starting of output.
  
  HashTable<string> hashTable; //accessing the template class.
  fp.open("words.dat"); //open file.
  string word;
  while (fp >> word) //while loop to insert each word from file into table.
    {
      hashTable.insert(word);
    }
  fp.close(); //closing file.
  
  hashTable.displayStats(); //displaying the load factor and collisons encountered.
  cout << "Done!" << endl;
  
  while (true)
    {
      cout << "Enter a word for spell checking (enter done to exit): ";
      cin >> word; //takes in word from user input.
      
      if (word == "done") //exit program.
        {
	  cout << "Bye." << endl;
	  break;
        }
      
      if (hashTable.spellC(word)) //if correct spelling, output correct.
        {
	  cout << "Correct!" << endl;
        }
      else
        {
	  cout << "Wrong! Possible corrections: ";

	  // Generate and display correction suggestions
	  vector<string> correctThis = gencorrections(word);
	  for (size_t i = 0; i < correctThis.size(); ++i)
            {
	      if (hashTable.contains(correctThis[i]))
                {
		  cout << correctThis[i];
		  if (i != correctThis.size() - 1)
		    cout << " ";
                }
            }
	  
	  cout << endl;
        }
    }

  return 0;
}

// Function implementation
vector<string> gencorrections(const string &word) {
    vector<string> newWord; //functin to make corrections to the wrong spelling word.

    // Type 1: Missing a character
    size_t i = 0;
    while (i <= word.size()) {
        char alpha = 'a';
        while (alpha <= 'z') { //checks each character to dictionary words to fix the missing character.
            string suggestedWord = word; 
            suggestedWord.insert(i, 1, alpha);
            newWord.push_back(suggestedWord);
            alpha++;
        }
        i++;
    }

    // Type 2: Having an extra character
    i = 0;
    while (i < word.size()) {
        char alpha = 'a';
        while (alpha <= 'z') {
            string suggestedWord = word;
            suggestedWord.erase(i, 1); //erases the character if the hash table finds the extra.
            newWord.push_back(suggestedWord);
            alpha++;
        }
        i++;
    }

    // Type 3: Substituting one character with another
    i = 0;
    while (i < word.size()) {
        char alpha = 'a';
        while (alpha <= 'z') {
            if (alpha != word[i]) { // Avoids unnecessary replacements
                string suggestedWord = word;
                suggestedWord[i] = alpha; //changes the word by replacing the character.
                newWord.push_back(suggestedWord);
            }
            alpha++;
        }
        i++;
    }

    
    sort(newWord.begin(), newWord.end()); //sorts the words by alphabetical order by algorithm library.
    newWord.erase(unique(newWord.begin(), newWord.end()), newWord.end()); //removes duplication from above cases.

    return newWord; //returns the words to the user.
}
