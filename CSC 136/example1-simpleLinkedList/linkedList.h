#ifndef LINKEDLIST_H
#define LINKEDLIST_H

#include <iostream>
using namespace std;

//define the list node
struct node{
  int num;
  node *next;
};

class linkedList
{
 public:
  linkedList();
  void insertAtEnd(int x);
  void print() const;
  void insertInFront(int x); 
  int search(int x) const; 
  void deleteNode(int x); 
              break; // break out of the while loop.
  linkedList( const linkedList& other); 
private:
  node *head;
  node *tail;
  int count;

};





#endif
