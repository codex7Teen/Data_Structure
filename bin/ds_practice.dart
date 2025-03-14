class Node {
  int data;
  Node? next;
  Node(this.data);
}

class Stack {
  Node? top;

  // add
  void pushStack(int data) {
    Node? temp = top;
    Node newNode = Node(data);

    if(temp == null) {
      top = newNode;
      return;
    }

    newNode.next = top;
    top = newNode;
  }

  // display
  void displayStack() {
    
  }
}