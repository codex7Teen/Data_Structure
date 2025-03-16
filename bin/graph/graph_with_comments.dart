class Graph {
  // A map to store the graph where each key is a vertex and the value is a list of edges (adjacent vertices).
  Map<int, List<int>> graph = {};

  //! //! Insert an edge into the graph. If bidirectional, adds the edge in both directions.
  // If the graph is bidirectional, the edge is added in both directions.
  void insert(int vertex, int edge, [bool isbidirectional = false]) {
    // If the vertex does not exist in the graph, initialize it with an empty list.
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
    // If the edge does not exist in the graph, initialize it with an empty list.
    if (!graph.containsKey(edge)) {
      graph[edge] = [];
    }
    // Add the edge to the vertex's list of edges.
    graph[vertex]!.add(edge);
    // If the graph is bidirectional, add the vertex to the edge's list of edges.
    if (isbidirectional) {
      graph[edge]!.add(vertex);
    }
  }

  // //! show the edges connected to a given vertex.
  // void showedges(int vertex) {
  //   if (graph.containsKey(vertex)) {
  //     print(graph[vertex]);
  //   }
  // }

  //! (BFS) traversal starting from a given vertex.
  bfs(int vertex) {
    // A set to keep track of visited vertices to avoid cycles.
    Set<int> visited = {};
    // A queue to manage the BFS traversal order.
    List<int> que = [];

    // Mark the starting vertex as visited and add it to the queue.
    visited.add(vertex);
    que.add(vertex);
    while (que.isNotEmpty) {
      // Dequeue the current vertex from the queue.
      int current = que.removeAt(0);
      // Explore all adjacent vertices of the current vertex.
      for (var i in graph[current]!) {
        // If an adjacent vertex has not been visited, mark it as visited and enqueue it.
        if (!visited.contains(i)) {
          visited.add(i);
          que.add(i);
        }
      }
    }
    // Print all visited vertices in the order they were discovered.
    print(visited);
  }

  //! (DFS) traversal starting from a given vertex.
  dfs(int vertex) {
    if (graph.containsKey(vertex)) {
      // A set to keep track of visited vertices.
      Set<int> visited = {};
      // Start the DFS traversal using a helper method.
      dfshelper(vertex, visited);
      // Print all visited vertices in the order they were discovered.
      print(visited);
    }
  }

  // Helper method for DFS traversal that uses recursion.
  dfshelper(int vertex, Set<int> visited) {
    // Mark the current vertex as visited.
    visited.add(vertex);
    // Explore all adjacent vertices of the current vertex.
    for (var i in graph[vertex]!) {
      // If an adjacent vertex has not been visited, recursively visit it.
      if (!visited.contains(i)) {
        dfshelper(i, visited);
      }
    }
  }

  //! display the entire graph.
  void display() {
    graph.forEach((key, vertex) {
      print('$key:$vertex');
    });
  }
}

void main() {
  Graph graph = Graph();
  graph.insert(10, 14);
  graph.insert(10, 15);
  graph.insert(19, 10);
  graph.insert(10, 17);
  graph.insert(10, 18);
  graph.insert(17, 19);
  graph.insert(17, 20);
  // graph.dfs(10);
  graph.bfs(10);
}
