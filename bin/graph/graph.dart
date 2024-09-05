class Graph {
  // A map to store the graph where each key is a vertex and the value is a list of edges (adjacent vertices).
  Map<int, List<int>> graph = {};

  //! Insert an edge into the graph. If bidirectional, adds the edge in both directions.
  void insert(int vertex, int edge, [bool isbidirectional = false]) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    graph[vertex]!.add(edge);
    if (isbidirectional) {
      graph[edge]!.add(vertex);
    }
  }

  //! Breadth-First Search (BFS) traversal starting from a given vertex.
  bfs(int vertex) {
    Set<int> visited = {};
    List<int> que = [];

    visited.add(vertex);
    que.add(vertex);
    while (que.isNotEmpty) {
      int current = que.removeAt(0);
      for (var i in graph[current]!) {
        if (!visited.contains(i)) {
          visited.add(i);
          que.add(i);
        }
      }
    }
    print(visited);
  }

  //! Depth-First Search (DFS) traversal starting from a given vertex.
  dfs(int vertex) {
    if (graph.containsKey(vertex)) {
      Set<int> visited = {};
      dfshelper(vertex, visited);
      print(visited.toList());
    }
  }

  // Helper method for DFS traversal using recursion.
  dfshelper(int vertex, Set<int> visited) {
    visited.add(vertex);
    for (var i in graph[vertex]!) {
      if (!visited.contains(i)) {
        dfshelper(i, visited);
      }
    }
  }

  //! Display the entire graph.
  void display() {
    graph.forEach((key, vertex) {
      print('$key:$vertex');
    });
  }
}

void main() {
  Graph grap = Graph();
  grap.insert(10, 14);
  grap.insert(10, 15);
  grap.insert(19, 10);
  grap.insert(10, 17);
  grap.insert(10, 18);
  grap.insert(17, 19);
  grap.insert(17, 20);
  grap.bfs(10);
}
