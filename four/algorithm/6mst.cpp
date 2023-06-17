#include <iostream>
#include <vector>
#include <queue>
#include <climits>
struct Edge {
    int src, dest, weight;
};
struct Node {
    int vertex, key;
};
struct Comparison {
    bool operator()(const Node& node1, const Node& node2) {
        return node1.key > node2.key;
    }
};
void findMST(const std::vector<std::vector<int>>& graph) {
    int numVertices = graph.size();
    std::priority_queue<Node, std::vector<Node>, Comparison> pq;
    std::vector<int> key(numVertices, INT_MAX);
    std::vector<int> parent(numVertices, -1);
    std::vector<bool> inMST(numVertices, false);
    int startVertex = 0;
    pq.push({ startVertex, 0 });
    key[startVertex] = 0;

    while (!pq.empty()) {
        int u = pq.top().vertex;
        pq.pop();

        inMST[u] = true;
        for (int v = 0; v < numVertices; ++v) {
            if (graph[u][v] && !inMST[v] && graph[u][v] < key[v]) {
                key[v] = graph[u][v];
                parent[v] = u;
                pq.push({ v, key[v] });
            }
        }
    }
    std::cout << "Minimum Cost Spanning Tree Edges:\n";
    for (int i = 1; i < numVertices; ++i) {
        std::cout << "Edge: " << parent[i] << " - " << i << "   Cost: " << graph[i][parent[i]] << std::endl;
    }
}

int main() {
    std::vector<std::vector<int>> graph = {
        {0, 7, 0, 7, 0},
        {9, 0, 6, 8, 5},
        {0, 5, 0, 0, 7},
        {6, 8, 0, 0, 2},
        {0, 5, 2, 8, 0}
    };

    findMST(graph);

    return 0;
}

