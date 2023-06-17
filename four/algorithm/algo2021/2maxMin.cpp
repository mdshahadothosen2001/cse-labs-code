#include <iostream>
#include <climits>
void findMaxMin(int arr[], int low, int high, int& maxVal, int& minVal) {
    if (low == high) {
        maxVal = minVal = arr[low];
        return;
    }
    if (high - low == 1) {
        if (arr[low] < arr[high]) {
            maxVal = arr[high];
            minVal = arr[low];
        } else {
            maxVal = arr[low];
            minVal = arr[high];
        }
        return;
    }
    
    int mid = (low + high) / 2;
    int maxVal1, minVal1, maxVal2, minVal2;
    
    findMaxMin(arr, low, mid, maxVal1, minVal1);
    findMaxMin(arr, mid + 1, high, maxVal2, minVal2);

    maxVal = (maxVal1 > maxVal2) ? maxVal1 : maxVal2;
    minVal = (minVal1 < minVal2) ? minVal1 : minVal2;
}

int main() {
    int arr[] = {9, 22, 77, 42, 52, 26, 12, 82, 3,9};
    int size = sizeof(arr) / sizeof(arr[0]);
    int maxVal, minVal;
    
    findMaxMin(arr, 0, size - 1, maxVal, minVal);
    
    std::cout << "Maximum element: " << maxVal << std::endl;
    std::cout << "Minimum element: " << minVal << std::endl;
    
    return 0;
}
