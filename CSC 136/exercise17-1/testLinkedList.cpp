#include "linkedList.h"
#include <iostream>
using namespace std;

int main()
{
  linkedList a;

  //add some values to the list
  a.insertAtEnd(5);
  a.insertAtEnd(7);
  a.insertAtEnd(6);
  a.insertAtEnd(2);
  a.insertAtEnd(9);
  a.insertAtEnd(11);
  a.insertAtEnd(8);
  a.insertAtEnd(3);

  //print the list
  a.print();

  
  //call the deleteMin() three times
  for (int i=0; i<3; i++)
    {
      a.deleteMin();
      cout << "After deleteMin(): \n";
      a.print();
    }
  
}