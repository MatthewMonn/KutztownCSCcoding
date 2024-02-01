#include <iostream>
#include "linkedList.h"

using namespace std;

int main()
{

  //create an integer list
  linkedListType<int> intList;

  //create an empty list
  linkedListType<int> intList2;
  int num[8] = {9, 3, 5, -7, 4, 5, 1, 8};

  //insert some integers in intList
  for (int i = 0; i < 8; i++)
    intList.insertFront(num[i]);

  cout << "intList: ";
  intList.print();

  cout << endl;

  //testing contains()
  cout << "Testing contains():\n";
  cout << "intList contains 9? " << boolalpha << intList.contains(9)<< endl;
  cout << "intList contains 5? " << boolalpha << intList.contains(5) << endl;
  cout << "intList contains 0? " << boolalpha << intList.contains(0) << endl;

  cout << endl;
  
  //testing getElement()
  cout << "Testing getElement():\n";
  cout << "get element at position 1: " << intList.getElement(1) << endl;
  cout << "get element at position 5: " << intList.getElement(5) << endl;
  cout << "get element position 8: " << intList.getElement(8) << endl;

  //testing getPosition()

  cout << endl;
  cout << "Testing getPosition():\n";
  cout << "get position for 8: " << intList.getPosition(8) << endl;
  cout << "get position for 5: " << intList.getPosition(5) << endl;
  cout << "get position for 9: " << intList.getPosition(9) << endl;
  cout << "get position for 15: " << intList.getPosition(15) << endl;
  cout << "get position from empty list: " << intList2.getPosition(15) << endl;

  cout << endl;
  
  //test replace()
  cout << "Testing replace():\n";
  intList.replace(1, 11);
  cout << "after replacing position 1 with 11\n";
  intList.print();

  intList.replace(4, 14);
  cout << "after replacing position 4 with 14\n";
  intList.print();

  intList.replace(8, 18);
  cout << "after replacing position 8 with 18\n";
  intList.print();

  //testing remove()
  cout << endl;
  cout << "Testing remove():\n";
  cout << "after removing element at position 1:\n";
  intList.remove(1);
  intList.print();

  cout << "after removing element at position 3:\n";
  intList.remove(3);
  intList.print();
  
  cout << "after removing element at position 6:\n";
  intList.remove(6);
  intList.print();

}
