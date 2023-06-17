#include <iostream>
#include <vector>

bool isSafe(const std::vector<std::vector<int>>& graph, const std::vector<int>& colors, int vertex, int color) {
    for (int i = 0; i < graph.size(); ++i) {
        if (graph[vertex][i] && colors[i] == color)
            return false;
    }
    return true;
}

bool colorGraphUtil(const std::vector<std::vector<int>>& graph, int numColors, std::vector<int>& colors, int vertex) {
    int numVertices = graph.size();
    if (vertex == numVertices)
        return true;

    for (int color = 1; color <= numColors; ++color) {
        if (isSafe(graph, colors, vertex, color)) {
            colors[vertex] = color;
            if (colorGraphUtil(graph, numColors, colors, vertex + 1))
                return true;
            colors[vertex] = 0; 
        }
    }
    return false;}
bool colorGraph(const std::vector<std::vector<int>>& graph, int numColors, std::vector<int>& colors) {
    if (graph.empty())
        return false;

    int numVertices = graph.size();
    colors.resize(numVertices, 0);

    if (colorGraphUtil(graph, numColors, colors, 0))
        return true;

    return false;
}

int main() {
    std::vector<std::vector<int>> graph = {
        {0, 1, 1, 1},
        {1, 0, 1, 0},
        {1, 1, 0, 1},
        {1, 0, 1, 0}
    };

    int numColors = 3;
    std::vector<int> colors;

    if (colorGraph(graph, numColors, colors)) {
        std::cout << "Graph can be colored using " << numColors << " colors.\n";
        std::cout << "Color assignment for each vertex:\n";
        for (int i = 0; i < colors.size(); ++i) {
            std::cout << "Vertex " << i << ": Color " << colors[i] << std::endl;
        }
    } else {
        std::cout << "Graph cannot be colored using " << numColors << " colors.\n";
    }
    return 0;}
