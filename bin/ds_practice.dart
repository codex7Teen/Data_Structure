class Graph {

  Map<int, List<int>> graph = {};

  void insert(int vertex, int edge, [isbidirectional = false]) {

    if(!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }

    if(!graph.containsKey(edge)) {
      graph[edge] = [];
    }

    graph[vertex]!.add(edge);

    if(isbidirectional) {
      graph[edge]!.add(vertex);
    }
  }


  void bfs(int vertex) {
    Set<int> visited = {};

    List<int> queue = [];

    visited.add(vertex);
    queue.add(vertex);

    while(queue.isNotEmpty) {

      int current = queue.removeAt(0);

      for(var i in graph[current]!) {
        if(!visited.contains(i)) {
          visited.add(i);
          queue.add(i);
        }
      }
    }
    print(visited);
  }
}

void main() {
  Graph graph = Graph();

  graph.insert(10, 34);
  graph.insert(10, 20);
  graph.insert(20, 53);

  graph.bfs(10);
}