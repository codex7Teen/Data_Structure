class Node {
  int data;
  Node? next;
  Node(this.data);
}

class Stack {
  Node? top;

  void push(int data) {
    Node newStack = Node(data);

    if(top == null) {
      top = newStack;
    } else {
      newStack.next = top;
      top = newStack;
    }
  }

  void display() {
    Node? temp = top;

    if(temp == null) {
      return;
    }

    while(temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void popStack(int data) {
    Node? temp = top;
    if(top == null) {
      return;
    }

    if(temp!.data == data) {
      top = temp.next;
      return;
    } 


    
  }
}

void main() {
  Stack stack = Stack();

  stack.push(20);
  stack.push(20);

  stack.display();
}