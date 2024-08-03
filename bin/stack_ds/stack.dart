class Node {
  int data;
  Node? next;
  Node(this.data);
}

class Stack {
  Node? top;

  //! display stack
  void displayStack() {
    Node? temp = top;
    if(top ==  null) {
      print('stack is empty');
      return;
    }

    while(temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  //! push
  void pushStack(int data) {
    Node newNode = Node(data);
    Node? temp = top;

    if(temp == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  //! pop 
  void popStack() {

    if (top == null) {
      print('stack is empty nothing to pop');
      return;
    }
    top = top!.next;
  }

  //! delete mid
  void deleteMid() {
    Node? fast = top;
    Node? slow = top;
    Node? prev;

    while(fast!.next != null) {
      fast = fast.next!.next;
      prev = slow;
      slow = slow!.next;
    }
    prev!.next = slow!.next;
    
  }

}

void main() {
  Stack stack = Stack();
  stack.pushStack(1);
  stack.pushStack(2);
  stack.pushStack(3);

  stack.popStack();

  stack.displayStack();
}