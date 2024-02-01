//Testing three implementation of the bag ADT.
//Do not modify this file.

#include "BagInterface.h"
#include "ArrayBag.h"
#include "LinkedBag.h"
#include "ArrayLinkedBag.h"
#include <iostream>
#include <string>
#include <iomanip>

using namespace std;

//display the content of the bag
void displayBag(BagInterface<string>* bagPtr);

//test methods in bag ADT
void bagTester(BagInterface<string>* bagPtr);


int main()
{
  //create an bag interface pointer
  BagInterface<string>* bagPtr = nullptr;

  //read user choice
  int userChoice;
  cout << endl;
  cout << "1: test Array-based implementation: \n";
  cout << "2: test LinkedList-based implementation: \n";
  cout << "3: test ArrayLinked-based implementation: \n";
  cout << "Enter your choice [1-3]: ";
  cin >> userChoice;
  
  
  if (userChoice == 1)
    {
      //testing array bag
      bagPtr = new ArrayBag<string>();
      cout <<  endl;
      cout << "Testing the Array-Based Bag:" << endl;
    }
  else if (userChoice == 2)
    {
      //testing linked bag
      bagPtr = new LinkedBag<string>();
      cout << endl;
      cout << "Testing the Link-Based Bag:" << endl;
    }
  else if (userChoice == 3)
    {
      //testing array linked bag
      bagPtr = new ArrayLinkedBag<string>();
      cout << endl;
      cout << "Testing the ArrayLink-Based Bag:" << endl;
    }
  else
    cout << "Invalid choice.\n";
  

  bagTester(bagPtr);
  delete bagPtr;
  bagPtr = nullptr;
  cout << "All done!" << endl;
   
   return 0;
} // end main


void displayBag(BagInterface<string>* bagPtr)
{
  //cout << "The bag contains " << bagPtr->getCurrentSize()
  //         << " items:" << endl;
   vector<string> bagItems = bagPtr->toVector();
   int numberOfEntries = bagItems.size();
   if (numberOfEntries == 0)
     {
       cout << "{ }" << endl;
       return;
     }
   cout << "{ ";
   int i = 0;
   for (i = 0; i < numberOfEntries - 1; i++)
   {
      cout << bagItems[i] << ", ";
   }
   cout << bagItems[i] << " }";
   cout << endl;
} // end displayBag

void bagTester(BagInterface<string>* bagPtr)
{
  cout << left;
  //test isEmpty()
  
  cout << "The initial bag is empty." << endl;
  cout <<setw(25)<< "isEmpty():" << boolalpha << bagPtr->isEmpty() << endl;
  cout << endl;

  //test add(), toVector(), getCurrentSize()
  string items[] = {"one", "two", "three", "four", "five", "one"};
  cout << "==Add 6 items==" << endl;
  for (int i = 0; i < 6; i++)
    {
      bagPtr->add(items[i]);
    }
  
  cout <<setw(25)<<"toVector(): ";
  displayBag(bagPtr);
  
  cout <<setw(25)<< "getCurrentSize(): "<< bagPtr->getCurrentSize() << endl;
  cout << endl;
  
  //test isEmpty(), add(), remove()
  cout << setw(25) << "isEmpty():" << boolalpha << bagPtr->isEmpty() << endl;
  cout << setw(25)<< "Add an item returns : " << boolalpha << bagPtr->add("extra") << endl;
  
  cout << endl;
  cout << "==Remove four, add one== "<< endl;
  bagPtr->remove("four");
  bagPtr->add("one");
  cout << setw(25) << "toVector(): ";
  displayBag(bagPtr);
  
  cout << endl;
  cout << "==Remove three, add two== "<< endl;
  bagPtr->remove("three");
  bagPtr->add("two");
  cout << setw(25) <<"toVector(): ";
  displayBag(bagPtr);
  cout << endl;

  //test getFrequencyOf()
  cout << setw(25) <<"getFrequencyOf(one): ";
  cout << bagPtr->getFrequencyOf("one")<< endl;
  cout << setw(25) <<"getFrequencyOf(two): ";
  cout << bagPtr->getFrequencyOf("two")<< endl;
  cout << endl;
  
  //test contains()
  cout << setw(25) <<"contains(five): " << bagPtr->contains("five") << endl;
  cout << setw(25) <<"contains(seven): " << bagPtr->contains("seven") << endl;
  cout << endl;
  
  //test clear()
  cout << "==Clearing the bag==\n";
  bagPtr->clear();
  cout << setw(25) <<"getCurrentSize(): "<< bagPtr->getCurrentSize() << endl;
  
} // end bagTester

