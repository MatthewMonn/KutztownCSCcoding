/**
 * @file bubblesort.hpp
 */
#ifndef BUBBLESORT_H
#define BUBBLESORT_H

#include <algorithm>

/**
 * Sorts the items in an array into ascending order.
 * @pre  None.
 * @post  theArray is sorted into ascending order; n is unchanged.
 * @param theArray  The given array.
 * @param n  The size of theArray.
 * @return The number of comparison operations.
 */
template<class ItemType>
int bubblesort(ItemType theArray[], int n) {
  bool sorted = false;
  int pass = 1;
  int counter = 0;
  while (!sorted && (pass < n)) {
    sorted = true;
    for (int index = 0; index < n - pass; index++) {
      int nextIndex = index + 1;
      if (theArray[index] > theArray[nextIndex]) {
	// Exchange entries
	std::swap(theArray[index], theArray[nextIndex]);
	sorted = false;
	
      }
      counter++;
    }
    pass++;
    
  }
  return counter; // this return value is not correct
}


#endif
