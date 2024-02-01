/**
 * @file sort_benchmark.cpp
 * @brief compare basic sorting algorithms
 */
 
/**************************************************************/
/*   Author:            Matthew Monn                          */
/*   Creation Date:     November 10  2023                     */
/*   Due Date:          November 13, 2023                     */
/*   Course:            CSC 237                               */
/*   Professor Name:    Dr. Zhang                             */
/*   Assignment:        #4                                    */
/*   Filename:          main.cpp                              */
/*   Purpose:           To add counters to different sorting  */
/*                      Methods and output in a neat table by */
/*                      sizes of 10, 100, 1000, and 10000     */ 
/*                      arrays.                               */ 
/**************************************************************/

#include <iostream>
#include <stdlib.h>
#include <iomanip>

#include "bubblesort.hpp"
#include "insertionsort.hpp"
#include "selectionsort.hpp"
#include "mergesort.hpp"
#include "quicksort.hpp"

int* makeRandomArray(int n, int seed);
void printArray(int* a, int size);
int C;
using namespace std;
int main() {
  // use 9000 as the random seed
  const int seed = 9000;
  
  // Example of running the sort algorithms with the random array.
  // TODO Remove or comment out this code before submission.
  int n = 10;
  int* a;
  int C, C1, C2, C3, C4; //used as temporary counter storage. 
  int i = 0; //index for loops.
  int BubbleA[4]; //bubble counter array. 
  int SelectionA[4]; // selection counter array.
  int InsertionA[4]; // insertion counter array.
  int MergeA[4]; // merge counter array. 
  int QuickA[4];// quick counter array.
  int previous = 0, previous1 = 0; //used to prevent addition of arrays when running the loops.
  
  /** 
   * The for loops below are used to create the above counter arrays. Starting from n = 10
   * and running till 10000. Each temporary variable stores the counter and then is inputted into the counter array per position.
   * the temp variable is then reset to 0 for next loop. 
   */
  for (i = 0; i < 4; i++)
    {
      a = makeRandomArray(n, seed);
      C = selectionsort(a, n);
      delete [] a;
      SelectionA[i] = C;
      n = n * 10; 
      C = 0;
    }
  n = 10;
  
  for (i = 0; i < 4; i++) 
    {
      a = makeRandomArray(n, seed);
      C1 = bubblesort(a, n);
      delete [] a;
      BubbleA[i] = C1;
      n = n * 10; 
      C1 = 0;
    }
  n = 10;
  
  for (i = 0; i < 4; i++) 
    {
      a = makeRandomArray(n, seed);
      C2 = insertionsort(a, n);
      delete [] a;
      InsertionA[i] = C2;
      n = n * 10; 
      C2 = 0;
    }
  n = 10; 
  
  for (i = 0; i < 4; i++) 
    {
      a = makeRandomArray(n, seed);
      C3 = mergesort(a, 0, n-1);
      delete [] a;
      MergeA[i] = C3 - previous;
      previous = C3; 
      n = n * 10; 
      C3 = 0;
    }
  n = 10; 
  for (i = 0; i < 4; i++) 
    {
      a = makeRandomArray(n, seed);
      C4 = quicksort(a, 0, n-1);
      delete [] a;
      QuickA[i] = C4 - previous1;
      previous1 = C4; 
      n = n * 10; 
      C4 = 0;
    }
  //the output below runs through each postion of the arrays and sets them in a neat table as needing for output. 
  i = 0; //reset the index to 0 for output. 
  cout << setw(16) << "|" << setw(11) << "10 |" << setw(11) << "100 |" << setw(11) << "1000 |" << setw(11) << "10000 |" << endl; 
  cout << setfill('-') << setw(16) << "+" << setw(11) << "+" << setw(11) << "+" << setw(11) << "+" << setw(11) << "+" << endl;
  cout << "Selection Sort |" << setfill(' ') << setw(9) << SelectionA[i] << " |" << setw(9) << SelectionA[i + 1] << " |" << setw(9); 
  cout << SelectionA[i + 2] << " |" << setw(9) << SelectionA[i+3] << " |" << endl; 
  cout << "Bubble Sort    |" << setfill(' ') << setw(9) << BubbleA[i] << " |" << setw(9) << BubbleA[i + 1] << " |"; 
  cout << setw(9) << BubbleA[i + 2] << " |" << setw(9) << BubbleA[i+3] << " |" << endl;
  cout << "Insertion Sort |" << setfill(' ') << setw(9) << InsertionA[i] << " |" << setw(9) << InsertionA[i + 1]; 
  cout << " |" << setw(9) << InsertionA[i + 2] << " |" << setw(9) << InsertionA[i+3] << " |" << endl;
  cout << "Merge Sort     |" << setfill(' ') << setw(9) << MergeA[i] << " |" << setw(9) << MergeA[i + 1] << " |"; 
  cout << setw(9) << MergeA[i + 2] << " |" << setw(9) << MergeA[i+3] << " |" << endl;
  cout << "Quick Sort     |" << setfill(' ') << setw(9) << QuickA[i] << " |" << setw(9) << QuickA[i + 1] << " |"; 
  cout << setw(9) << QuickA[i + 2] << " |" << setw(9) << QuickA[i+3] << " |" << endl;
  
  return 0;
}


/**
 * Generate an array of random integers
 * @param n the size of the array
 * @param seed the seed for the random number generator
 * @return a pointer to a new array
 * @note the client is responsible for deleting the array with delete[]
 */
int* makeRandomArray(int n, int seed) {
    srand(seed);
    int * a = new int[n];
    for (int i = 0; i < n; i++) {
        a[i] = rand() % 1000;
    }
    return a;
}



void printArray(int* a, int size) {
    std::cout << "[ ";
    for (int i = 0; i < size; i++) {
        std::string sep = (i == size-1) ? " " : ", ";
        std::cout << a[i] << sep;
    }
    std::cout << "]" << std::endl;
}
