#include <iostream>
#include <vector>
using namespace std;

int binarySearch(vector<int>& array,int item,int low,int high)
{
    if (low>high)
    {
        return -1;
    }
    int mid = low + (high - low)/2;
    
    if (array[mid] == item)
    {
        return mid;
    }
    else if (item<array[mid])
    {
        return binarySearch(array,item,low,mid-1);
    }
    else
    {
        return binarySearch(array,item,mid+1,high);
    }

}
int main(){
vector<int> array ={2,3,4,5,6,7,8,9};
int item = 10;
int index = binarySearch(array,item,0,7);
if (index == -1)
cout<<"Element not found!"<<endl;
else
cout<<"Element index is "<<index<<endl;
return 0;
}
    