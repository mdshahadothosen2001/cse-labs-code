#include <iostream>
#include <vector>
#include <queue>
#include <climits>
struct Edge {
    int dest;
    int weight;
};

void findShortestPath(int startVertex, const std::vector<std::vector<Edge>>& graph, std::vector<int>& distances) {
    int numVertices = graph.size();
    std::priority_queue<std::pair<int, int>, std::vector<std::pair<int, int>>, std::greater<std::pair<int, int>>> pq;
    distances.resize(numVertices, INT_MAX);
    distances[startVertex] = 0;
    pq.push(std::make_pair(0, startVertex));

    while (!pq.empty()) {
        int u = pq.top().second;
        pq.pop();
        for (const Edge& edge : graph[u]) {
            int v = edge.dest;
            int weight = edge.weight;
            if (distances[u] != INT_MAX && distances[u] + weight < distances[v]) {
                distances[v] = distances[u] + weight;
                pq.push(std::make_pair(distances[v], v));
            }
        }
    }
}

int main() {
    int numVertices = 5;
    int startVertex = 0;

    std::vector<std::vector<Edge>> graph(numVertices);
    graph[0].push_back({ 1, 8 });
    graph[0].push_back({ 2, 4 });
    graph[1].push_back({ 2, 1 });
    graph[1].push_back({ 3, 9 });
    graph[2].push_back({ 3, 3 });
    graph[2].push_back({ 4, 6 });
    graph[3].push_back({ 4, 3 });


    std::vector<int> distances;
    findShortestPath(startVertex, graph, distances);
    std::cout << "Shortest Distances from Vertex " << startVertex << ":\n";
    for (int i = 0; i < numVertices; ++i) {
        std::cout << "Vertex " << i << ": " << distances[i] << std::endl;
    }
    return 0;
}
