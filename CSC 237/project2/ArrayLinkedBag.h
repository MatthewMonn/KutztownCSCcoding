/** Header file for an array-based linked list implementation of the ADT bag.
  @file ArrayLinkedBag.h */

#ifndef ARRAY_LINKED_BAG_
#define ARRAY_LINKED_BAG_

#include "BagInterface.h"

template<class ItemType>
struct Cell {
  ItemType item;
  int next;
};



template<class ItemType>
class ArrayLinkedBag : public BagInterface<ItemType>
{
private:
  static const int DEFAULT_CAPACITY = 6;
  Cell<ItemType> cells[DEFAULT_CAPACITY];
  int head;
  int free;
  int itemCount;
  int maxItems;
  
  //declare private help method here if necessary
  
public:
  ArrayLinkedBag();
  int getCurrentSize() const;
  bool isEmpty() const;
  bool add(const ItemType& newEntry);
  bool remove(const ItemType& anEntry);
  void clear();
  bool contains(const ItemType& anEntry) const;
  int getFrequencyOf(const ItemType& anEntry) const;
  std::vector<ItemType> toVector() const;
};

#include "ArrayLinkedBag.cpp"
#endif
