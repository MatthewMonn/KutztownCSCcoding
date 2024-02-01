#ifndef QUADRATIC_PROBING_CPP
#define QUADRATIC_PROBING_CPP

#include <iostream>
#include <iomanip> // For setprecision
#include "QuadraticProbing.h"
using namespace std;


template <class HashedObj>
HashTable<HashedObj>::HashTable( int size )
  : array( nextPrime( size ) ), collisions(0)
{
  makeEmpty();
}

template <class HashedObj>
void HashTable<HashedObj>::makeEmpty( )
{
  
  currentSize = 0;
  for( int i = 0; i < array.size( ); i++ )
    {
      array[ i ].info = EMPTY;
    }
}

template <class HashedObj>
bool HashTable<HashedObj>::isPrime( int n )
{
  if( n == 2 || n == 3 )
    return true;
  
  if( n == 1 || n % 2 == 0 )
    return false;
  
  for( int i = 3; i * i <= n; i += 2 )
    if( n % i == 0 )
      return false;
  
  return true;
}

template <class HashedObj>
int HashTable<HashedObj>::nextPrime( int n )
{
  if( n % 2 == 0 )
    n++;
  
  for( ; !isPrime( n ); n += 2 )
    ;
  
  return n;
}


template <class HashedObj>
bool HashTable<HashedObj>::contains( const HashedObj & x ) const
{
  return isActive( findPos( x, collisions ) );
}


template <class HashedObj>
bool HashTable<HashedObj>::insert( const HashedObj & x )
{
  // Insert x as active
  int currentPos = findPos( x, collisions);
  if( isActive( currentPos ) )
    return false;
  
  array[ currentPos ].element = x;
  array[ currentPos ].info = ACTIVE;
  
  // Rehash
  if( ++currentSize > array.size( ) / 2 )
    rehash( );
  
  return true;
}


template <class HashedObj>
bool HashTable<HashedObj>::remove( const HashedObj & x )
{
  int currentPos = findPos( x, collisions );
  if( !isActive( currentPos ) )
    return false;
  
  array[ currentPos ].info = DELETED;
  return true;
}


template <class HashedObj>
bool HashTable<HashedObj>::isActive( int currentPos ) const
{
  return array[ currentPos ].info == ACTIVE;
}

template <class HashedObj>
int HashTable<HashedObj>::findPos( const HashedObj & x, int  & collisions ) const
{
  int offset = 1;
  int currentPos = myhash( x );
  
  while( array[ currentPos ].info != EMPTY &&
	 array[ currentPos ].element != x )
    {
      currentPos += offset;  // Compute ith probe
      offset += 2;
      if( currentPos >= array.size( ) )
	currentPos -= array.size( );
      collisions++; // Increment
    }
  
  return currentPos;
}

template <class HashedObj>
void HashTable<HashedObj>::rehash( )
{
  vector<HashEntry> oldArray = array;
  
  // Create new double-sized, empty table
  array.resize( nextPrime( 2 * oldArray.size( ) ) );
  for( int j = 0; j < array.size( ); j++ )
    array[ j ].info = EMPTY;
  
  // Copy table over
  currentSize = 0;
  for( int i = 0; i < oldArray.size( ); i++ )
    {
      if( oldArray[ i ].info == ACTIVE )
        {
	  insert( oldArray[ i ].element );
        }
    }
  
  // Print rehashing information
  cout << "Rehashing. New size is " << array.size() << endl;
}

template <class HashedObj>
int HashTable<HashedObj>::myhash( const HashedObj & x ) const
{
  int hashVal= hashKey(x); 
  
  hashVal %= array.size( );
  if( hashVal < 0 )
    hashVal += array.size( );
  
  return hashVal;
}

template <class HashedObj>
int HashTable<HashedObj>::hashKey( int key) const
{
  return key;
}

template <class HashedObj>
int HashTable<HashedObj>::hashKey(const string & key) const
{
  int hashVal = 0;
  
  for( int i = 0; i < key.length( ); i++ )
    hashVal = 37 * hashVal + key[ i ];
  
  return hashVal;
  
}


template <class HashedObj> //new function to check for spelling corrections.
bool HashTable<HashedObj>::spellC(const string &word) const
{
  int currentPos = findPos(word, collisions); //finds the position based on currentPos of the word.
  return isActive(currentPos); //returns active if the position is open for spelling.
}


template <class HashedObj> //displays the stats of load factor and collisions as needed.
void HashTable<HashedObj>::displayStats() const
{
  cout << endl << "The load factor is " << fixed << setprecision(2) << loadFactor() << "." << endl;
  cout << "There are in total " << collisions << " collisions during initialization." << endl;
}

template <class HashedObj>
double HashTable<HashedObj>::loadFactor() const //calculates how full the hash table is.
{
  return static_cast<double>(currentSize) / array.size();
}

#endif
