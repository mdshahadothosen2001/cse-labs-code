#include <iostream>
#include <vector>
#include <algorithm>
struct Item {
    int weight;
    int value;
};
int knapsack(int capacity, std::vector<Item>& items) {
    int n = items.size();
    std::vector<std::vector<int>> dp(n + 1, std::vector<int>(capacity + 1, 0));
    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= capacity; ++j) {
            if (items[i - 1].weight <= j) {
                dp[i][j] = std::max(items[i - 1].value + dp[i - 1][j - items[i - 1].weight], dp[i - 1][j]);
            } else {
                dp[i][j] = dp[i - 1][j];
            }
        }
    }

    return dp[n][capacity];
}

int main() {
    int capacity = 10;
    std::vector<Item> items = {
       {2, 18},
        {3, 21},
        {5, 27},
        {7, 25},
        {9, 30}
    };
    int optimalValue = knapsack(capacity, items);
    std::cout << "Optimal solution is " << optimalValue << std::endl;
   return 0;
}
