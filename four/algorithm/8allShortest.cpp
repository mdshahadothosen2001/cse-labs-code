#include <iostream>
#include <vector>
#include <climits>

void floydWarshall(std::vector<std::vector<int>>& graph) {
    int numVertices = graph.size();
    std::vector<std::vector<int>> distances(numVertices, std::vector<int>(numVertices));
    for (int i = 0; i < numVertices; ++i) {
        for (int j = 0; j < numVertices; ++j) {
            distances[i][j] = graph[i][j];
        }
    }

    for (int k = 0; k < numVertices; ++k) {
        for (int i = 0; i < numVertices; ++i) {
            for (int j = 0; j < numVertices; ++j) {
                if (distances[i][k] != INT_MAX && distances[k][j] != INT_MAX &&
                    distances[i][k] + distances[k][j] < distances[i][j]) {
                    distances[i][j] = distances[i][k] + distances[k][j];
                }
            }
        }
    }
    std::cout << "Shortest Distances between All Pairs:\n";
    for (int i = 0; i < numVertices; ++i) {
        for (int j = 0; j < numVertices; ++j) {
            if (distances[i][j] == INT_MAX) {
                std::cout << "INF\t";
            } else {
                std::cout << distances[i][j] << "\t";
            }
        }
        std::cout << std::endl;
    }
}

int main() {
    int numVertices = 4;
    std::vector<std::vector<int>> graph = {
        {0, 3, INT_MAX, 6},
        {5, 0, 2, INT_MAX},
        {5, INT_MAX, 0, 2},
        {9, INT_MAX, INT_MAX, 0}
    };
    floydWarshall(graph);
    return 0;
}
