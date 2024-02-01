#ifndef H_LinkedListType
#define H_LinkedListType
   
#include <iostream>
#include <cassert>
 
using namespace std;

//Definition of the node

template <class Type>
struct nodeType
{
  Type info;
  nodeType<Type> *link;
};



template <class Type>
class linkedListType
{
public:

  linkedListType();
  //Default constructor
  //Initializes the list to an empty state.
  //Postcondition: first = nullptr, last = nullptr,
  //               count = 0;


  ~linkedListType();
  //Destructor
  //Deletes all the nodes from the list.
  //Postcondition: The list object is destroyed.

  bool isEmptyList() const;
  //Function to determine whether the list is empty. 
  //Postcondition: Returns true if the list is empty,
  //               otherwise it returns false.

  void print() const;
  //Function to output the data contained in each node.
  //Postcondition: none
  
  int length() const;
  //Function to return the number of nodes in the list.
  //Postcondition: The value of count is returned.

  void insertFront(const Type& newItem);
  //Function to insert newItem at the beginning of the list.
  //Postcondition: first points to the new list, newItem is
  //               inserted at the beginning of the list,
  //               last points to the last node in the list,
  //               and count is incremented by 1.


  ///////////////////TO DO ///////////////////////////
  bool contains(const Type& searchItem) const;
  //Function to determine whether searchItem is in the list.
  //Postcondition: Returns true if searchItem is in the 
  //               list, otherwise the value false is 
  //               returned.


  Type getElement(int position) const;
  //Function to return the element at the desired position
  //of the list. Note the position starts at one.
  //Precondition: 1 <= position <= count

  int getPosition(Type element) const;
  //Function to return the position of the FIRST instance
  //of the element passed in as a parameter. If the element is
  //not in the list, then return -1.

  void replace(int position, Type element);
  //Function to replace the element at the desired position
  //of the list with the given element. Note the position starts
  //at one.
  //Precondition: 1 <= position <= count

  void remove(int position);
  //Function to delete the element at the desired position
  //of the list.
  //Precondition: 1 <= position <= count

  
private:
    int count;   //variable to store the number of 
                 //elements in the list
    nodeType<Type> *first; //pointer to the first node of the list


};

#include "linkedList.cpp"

#endif
