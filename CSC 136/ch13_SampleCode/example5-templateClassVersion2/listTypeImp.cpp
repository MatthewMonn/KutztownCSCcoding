template <class elemType>
bool listType<elemType>::isEmpty() const
{
  return (length == 0);
}

template <class elemType>
bool listType<elemType>::isFull() const
{
    return (length == maxSize);
}

template <class elemType>
int listType<elemType>::getLength() const
{
    return length;
}

template <class elemType>
int listType<elemType>::getMaxSize() const
{
    return maxSize;
}

    //Constructor; the default array size is 50
template <class elemType>
listType<elemType>::listType(int listSize) 
{
    maxSize = listSize;
    length = 0;
    list = new elemType[maxSize];
}

template <class elemType>
listType<elemType>::~listType()  //destructor
{
    delete [] list;
}

template <class elemType>
void listType<elemType>::sort()   //selection sort
{
    int min;
    elemType temp;

    for (int i = 0; i < length; i++)
    {
        min = i;
        for (int j = i + 1; j < length; ++j)
            if (list[j] < list[min])
                min = j;

        temp = list[i];
        list[i] = list[min];
        list[min] = temp;
    }//end for
}//end sort

template <class elemType>
void listType<elemType>::print() const
{
    for (int i = 0; i < length; ++i)
        cout << list[i] << " ";
    cout << endl;
}//end print


template <class elemType>
void listType<elemType>::insertAt(const elemType& item, 
                                  int position)
{
    assert(position >= 0 && position < maxSize);
    list[position] = item;
    length++;
}


