/** Implementation file for the class ArrayLinkedBag.
  @file ArrayLinkedBag.cpp */

/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     September 25, 2023                    */
/*   Due Date:          October 2, 2023                       */
/*   Course:            CSC 237                               */
/*   Professor Name:    Dr. Zhang                             */
/*   Assignment:        #2                                    */
/*   Filename:          ArrayLinkedBag.cpp                    */
/*   Purpose:           To implement the header file that     */
/*                      is a child class of LinkedBag.h to    */
/*                      run through the list and perform      */
/*                      adding and removing items, getting    */ 
/*                      current size, checking if empty,      */ 
/*                      frequency of an item, contains how    */
/*                      many of an item, and showing output   */
/*                      using vectors.                        */ 
/**************************************************************/

#include "ArrayLinkedBag.h"
#include <cstddef>

template<class ItemType>
ArrayLinkedBag<ItemType>::ArrayLinkedBag() 
{
  head = 0; //constructor function to set values to default or zero. 
  free = 0;
  itemCount = 0;
  maxItems = DEFAULT_CAPACITY; //maxItems cannot exceed the DEFAULT_CAPACITY as it is a static const as defined in header file.  
}                             

template<class ItemType>
int ArrayLinkedBag<ItemType>::getCurrentSize() const //the count of size is stored as the program is ran in itemCount. 
{
  return itemCount;
}

template<class ItemType>
bool ArrayLinkedBag<ItemType>::isEmpty() const //checks if the ArrayLinkedBag list is empty if the itemCount is 0 or not. (True or false). 
{
  
  return itemCount == 0;
}

template<class ItemType>
bool ArrayLinkedBag<ItemType>::add(const ItemType& newEntry)
{
  if (itemCount == DEFAULT_CAPACITY) //Checks if the function is full so it doesnt remove other data. 
    return false;
  else
    {
      for (int i = 0; i < maxItems; i++) //iterates through the ArrayLinkedBag list to enter the new entry into an empty string (empty item). 
	{
	  if (cells[i].item == "")
	    {
	      cells[i].item = newEntry;
	      cells[i].next = head; 
	      head = i;
	      itemCount++;
	      break;
	    }
	}
      return true; 
    }
}

template<class ItemType>
bool ArrayLinkedBag<ItemType>::remove(const ItemType& anEntry)
{
  for (int i = 0; i < maxItems; i++) //iterates through the ArrayLinkedBag list to see if the entry is in the list. 
    {
      if (cells[i].item == anEntry)
	{
	  cells[i].item = "";
	  itemCount = itemCount - 1; //sets the item box to empty and lowers the itemCount. 
	  return true;
	}
    }
  return false;
}

template<class ItemType>
void ArrayLinkedBag<ItemType>::clear() //clears the ArrayLinkedBag list when called by setting items to empty strings. 
{
  for (int i = 0; i < maxItems; i++)
    {
      cells[i].item = "";
    }
  itemCount = 0; //resets itemCount to zero. 
}

template<class ItemType>
int ArrayLinkedBag<ItemType>::getFrequencyOf(const ItemType& anEntry) const
{
  int countz = 0; //checks how many times an item appears in the list if at all and stores into countz. 
  for (int i = 0; i < maxItems; i++)
    {
      if ( cells[i].item == anEntry)
	{
	  countz++;
	} 
    }
  return countz;
}

template<class ItemType>
bool ArrayLinkedBag<ItemType>::contains(const ItemType& anEntry) const //Checks if the function contains the item and returns true or false. 
{
  for (int i = 0; i < maxItems; i++)
    {
      if (cells[i].item == anEntry)
	{
	  return true;
	}
    }
  return false; 
}

template<class ItemType>
std::vector<ItemType> ArrayLinkedBag<ItemType>::toVector() const //takes the ArrayLinkedBag list and uses vectors and functions to print out. 
{
  std::vector<ItemType> bagContents;
  for (int i = maxItems - 1; i >= 0; i--) 
    {
      bagContents.push_back(cells[i].item);
    }
  return bagContents;

}
