/**
 * @file insertionsort.hpp
 */

#ifndef INSERTIONSORT_H
#define INSERTIONSORT_H

/**
 * Sorts the items in an array into ascending order.
 * @pre  None.
 * @post  theArray is sorted into ascending order; n is unchanged.
 * @param theArray  The given array.
 * @param n  The size of theArray.
 * @return The number of comparison operations.
 */
template<class ItemType>
int insertionsort(ItemType theArray[], int n) {
  int counter = 0;
  for (int unsorted = 1; unsorted < n; unsorted++) {
    ItemType nextItem = theArray[unsorted];
    int loc = unsorted;
    while ((loc > 0) && (theArray[loc - 1] > nextItem)) {
      theArray[loc] = theArray[loc - 1];
      loc--;
      counter++;
    }
    if (loc > 0)
      counter++;
    
    if (theArray[loc - 1] > nextItem)
      counter++;
    theArray[loc] = nextItem;
  }
  return counter; // this return value is not correct
}

#endif
