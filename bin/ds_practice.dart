class Graph {
  
  Map<int, List<int>> graph = {};

  //! insert
  void insertInGraph(int vertex, int edges, [bool isbidirectional = false]) {

    if(!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }

    if(!graph.containsKey(edges)) {
      graph[edges] = [];
    }

    graph[vertex]!.add(edges);

    if(isbidirectional) {
      graph[edges]!.add(vertex);
    }
  }

  //! print graph

  void printGraph() {
    graph.forEach((key, value) {
      print('${key}, ${value}');
    });
  }
}

void main() {
  Graph graph = Graph();

  graph.insertInGraph(10, 25);
  graph.insertInGraph(20, 30);
  graph.insertInGraph(25, 50, true);

  graph.printGraph(); 

}