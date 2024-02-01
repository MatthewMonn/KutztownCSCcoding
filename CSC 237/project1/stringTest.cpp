/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     September 12, 2023                    */
/*   Due Date:          September 20, 2023                    */
/*   Course:            CSC 237                               */
/*   Professor Name:    Dr. Zhang                             */
/*   Assignment:        #1                                    */
/*   Filename:          stringTest.cpp                        */
/*   Purpose:           To add functions to manipulate a      */
/*                      linked list, 5 functions added. Then  */
/*                      by utilizing the template class, this */
/*                      file is manipulated to use string     */
/*                      instead of int to test outputs of     */
/*                      functions.                            */
/**************************************************************/

#include <iostream>
#include "linkedList.h"

using namespace std;

int main()
{
   //create an string list
  linkedListType<string> stringList;

  //create an empty list
  linkedListType<string> stringList2;
  string string[8] = {"Hi","Hello","High","Hai", "Dude","CompSci","CSC", "Bye"};

  //insert some strings in intList
  for (int i = 0; i < 8; i++)
    stringList.insertFront(string[i]);

  cout << "stringList: ";
  stringList.print();

  cout << endl;

  //testing contains()
  cout << "Testing contains():\n";
  cout << "stringList contains Hi? " << boolalpha << stringList.contains("Hi")<< endl;
  cout << "stringList contains High? " << boolalpha << stringList.contains("High") << endl;
  cout << "stringList contains Joe? " << boolalpha << stringList.contains("Joe") << endl;

  cout << endl;

  //testing getElement()
  cout << "Testing getElement():\n";
  cout << "get element at position 1: " << stringList.getElement(1) << endl;
  cout << "get element at position 5: " << stringList.getElement(5) << endl;
  cout << "get element position 8: " << stringList.getElement(8) << endl;

  //testing getPosition()

  cout << endl;
  cout << "Testing getPosition():\n";
  cout << "get position for Hi: " << stringList.getPosition("Hi") << endl;
  cout << "get position for Bye: " << stringList.getPosition("Bye") << endl;
  cout << "get position for Hai: " << stringList.getPosition("Hai") << endl;
  cout << "get position for CSC: " << stringList.getPosition("CSC") << endl;
  cout << "get position from empty list: " << stringList2.getPosition("Real") << endl;

  cout << endl;

  //test replace()
  cout << "Testing replace():\n";
  stringList.replace(1,"Boo");
  cout << "after replacing position 1 with Boo\n";
  stringList.print();
  stringList.replace(4, "Gator");
  cout << "after replacing position 4 with Gator\n";

  stringList.print();

  stringList.replace(8, "Eng");
  cout << "after replacing position 8 with Eng\n";
  stringList.print();

  //testing remove()
  cout << endl;
  cout << "Testing remove():\n";
  cout << "after removing element at position 1:\n";
  stringList.remove(1);
  stringList.print();

  cout << "after removing element at position 3:\n";
  stringList.remove(3);
  stringList.print();

  cout << "after removing element at position 6:\n";
  stringList.remove(6);
  stringList.print();

}
