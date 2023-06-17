#include <iostream>
#include<ctime>
#include<cstdlib>

using namespace std;
const int n = 10000;

void BubbleSort(int *a, int num){
    int temp;
    for(int i = 0; i <num; i++){
        for(int j = 0; j < num; j++){
            if(a[j] > a[j+1])
                    int temp = a[j];
                    a[j] = a[j+1];
                    a[j+1] = temp;

            }
        }
    }


int Partition(int *arr, int low, int high) {
    int pivot = arr[high];
    int i = low - 1;

    for (int j = low; j <= high - 1; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[high]);
    return i + 1;
}

void QuickSort(int *a, int i, int j){
    if(i<j){
        int m= Partition(a,i,j);
        QuickSort(a,i,m-1);
        QuickSort(a,m+1,j);
    }
}

int main()
{
    clock_t start, stop;
    int *array_1= new int[n];
    for(int i=0;i<n; array_1[i]= rand(),i++);


    start=clock();
    BubbleSort(array_1,n-1);
    stop=clock();

    cout<< "For " <<n<<" elements"<<endl<<"Bubble Sort:"<<((double)(stop-start))/CLOCKS_PER_SEC;

    start=clock();
    QuickSort(array_1, 0, n-1);
    stop=clock();

    cout<<endl<<"Quick Sort:"<<((double)(stop-start))/CLOCKS_PER_SEC<<endl<<"seconds";

    return 0;

}