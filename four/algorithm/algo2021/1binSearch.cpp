#include <iostream>
using namespace std;
int binarySearch(int arr[], int item, int low, int high)
{
    if (low > high)
        return -1;
    int mid = low + (high - low) / 2;
    if (arr[mid] == item)
        return mid;
    else if (item < arr[mid])
        return binarySearch(arr, item, low, mid - 1);
    else
        return binarySearch(arr, item, mid + 1, high);
}
int main()
{
    int arr[] = {1,2, 3, 4, 5, 6, 7, 8, 9};
    int item = 9;
    int index = binarySearch(arr, item, 0, 8);
    if (index == -1)
        cout << "Element not found!" << endl;
    else
        cout << "Element index is " << index + 1 << endl;
    return 0;
}
