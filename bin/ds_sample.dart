class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  void addNode(int data) {
    Node? temp = head;
    Node newNode = Node(data);

    if(temp == null) {
      head = newNode;
    } else {
      while(temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }

  void displayNode() {
    Node? temp = head;
    if(temp == null) {
      return;
    }

    while(temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void addEvenNumbers() {
    Node? temp = head;
    int sumOfEven = 0;

    if(temp == null) {
      return;
    }

    while(temp?.next != null) {
      if(temp!.data % 2 == 0){
        sumOfEven += temp.data;
      }
      temp = temp.next;
    }
    print(sumOfEven);
  }
}

void main() {
  LinkedList list = LinkedList();

  list.addNode(1);
  list.addNode(2);
  list.addNode(3);
  list.addNode(4);
  list.addNode(5);

  list.addEvenNumbers();

  
}