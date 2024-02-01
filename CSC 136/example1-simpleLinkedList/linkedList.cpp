#include "linkedList.h"
#include <iostream>

using namespace std;

linkedList::linkedList()
{
  head = nullptr;
  tail = nullptr;
  count = 0;
}

void linkedList::insertAtEnd(int x)
{
  //create a new node
  node* temp = new node;
  temp -> num = x;
  temp -> next = nullptr;

  //insert at end
  if (head == nullptr) //list is currently empty
    {
      head = temp;
      tail = temp;
    }
  else
    {
      tail -> next = temp;
      tail = tail -> next;
    }
  count++;  

}
void linkedList::insertInFront(int x)
{
  node * temp = new node;
  temp -> num = x;
  temp -> next = nullptr;
  if (head == nullptr)
    {
      head = temp;
      tail = temp;
    }
  else
    {
      temp -> next = head;
      head = temp; 
      
    }
  count++; 
}

int linkedList::search(int x) const
{
  int pos = 1; 
  node *temp = head;
  while (temp != nullptr)
    {
      if (temp -> num == x)
	return pos; 
      pos++;
      temp = temp -> next ; 
    }
  return -1; 
}
void linkedList::print() const
{
  node *temp = head;
  while (temp != nullptr)
    {
      cout << temp -> num;

      temp = temp -> next;

      if(temp!=nullptr)
	cout << " -> ";
    }
  cout << endl;


}
void linkedList::deleteNode(int x)
{ //case 1: the list is empty. 
  if (head == nullptr)
    cout << "Cannot delete from an empty list" << endl;
  //case 2: when the x is in the first node. 
  else if (head -> num == x)
    {
      node* temp = head;
      head = head -> next;
      count--;
      delete temp; //deallocate the node in the heap. 
    }
  // case 3: when x is not in the first node.
  else
    {
      node * previous = head;
      node * current = head -> next;
      while (current!= nullptr)
	{
	  if ( current -> num == x)
	    {
	      previous -> next = current -> next;
	      count --;
	    }
	      if (current == tail) //when x is in the last node. 
	        tail = previous;
	      
	      delete current;
	      break; // break out of the while loop. 
	    
	  
	}
      previous = previous -> next;
      current = current -> next; 
    }
}

linkedList::linkedList(const linkedList& other)
{
  if (other.head == nullptr) // case 1: if other is empty
    {
      head = nullptr;
      tail = nullptr;
      count = 0;
    }
  else // if other is not empty 
    {
      // first copy over the first node
      node * temp = new node;
      node * temp2 = other.head;
      temp -> num = temp2 -> num;
      temp -> next = nullptr;
      head = temp;
      tail = temp;
      // copy the rest of the list
      temp2 = temp2 -> next;
      while(temp2 != nullptr)
	{
	  temp = new node;
	  temp -> num = temp2 -> num;
	  temp -> next = nullptr;

	  tail -> next = temp;
	  tail = temp;
	  temp2 = temp2 -> next; 
	  temp -> next = nullptr; 
	}
  
      
      
    }
}
