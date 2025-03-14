class Node {
  int data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head;

//! adding a node
  addNode(int data) {
    if (head == null) {
      head = Node(data);
    } else {
      Node temp = head!;
      while (temp.next != null) {
        temp = temp.next!;
      }
      temp.next = Node(data);
    }
  }

//! deleting a node
  void deleteNode(int data) {
    Node? temp = head;
    Node? prev;

    if (temp != null && temp.data == data) {
      head = temp.next;
      return;
    }

    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }

    prev?.next = temp?.next;
  }

  // ! displaying a node (getting)
  void displayNode() {
    Node? temp = head;
    if (temp == null) {
      print('linked list is empty');
    }

    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  //! Find mid node
  void getMid() {
    Node? fast = head;
    Node? slow = head;

    while (fast?.next != null) {
      fast = fast?.next?.next;
      slow = slow?.next;
    }
    print(slow?.data);
  }

  //! inserting a node after a node
  void insertNodeAfter(int data, int after) {
    Node newNode = Node(data);
    Node? temp = head;

    while (temp != null && temp.data != after) {
      temp = temp.next;
    }

    if (temp == null) {
      print('the after value is not found');
    }

    newNode.next = temp!.next;
    temp.next = newNode;
  }

  //! inserting a node before a node
  void insertNodeBefore(int before, int data) {
    Node newNode = Node(data);
    Node? temp = head;
    bool found = false;

    if (head == null) {
      print('linked list is empty');
      return;
    }

    if (head!.data == before) {
      newNode.next = head;
      head = newNode;
      return;
    }

    while (temp!.next != null) {
      if (temp.next!.data == before) {
        found = true;
        newNode.next = temp.next;
        temp.next = newNode;
        break;
      }
      temp = temp.next;
    }

    if (!found) {
      print('The node to insert before is not found');
    }
  }

  //! Merge List
  void mergeList(LinkedList otherList) {
    if (head == null) {
      head = otherList.head;
    } else {
      Node temp = head!;

      while (temp.next != null) {
        temp = temp.next!;
      }
      temp.next = otherList.head;
    }
  }
}

void main() {
  LinkedList linkedList = LinkedList();

  linkedList.addNode(10);
  linkedList.addNode(20);
  linkedList.addNode(30);

  print("Linked List:");
  linkedList.displayNode();

  print('mid is :');
  linkedList.getMid();

  print('after 20 inserted linked listt: ');

  linkedList.insertNodeAfter(20, 10000);
  linkedList.displayNode();

  print('before 20 inserted linked listt: ');
  linkedList.insertNodeBefore(20, 20000);
  linkedList.displayNode();

  print('Merged list');

  LinkedList linkedList2 = LinkedList();

  linkedList2.addNode(100);
  linkedList2.addNode(200);
  linkedList2.addNode(300);

  LinkedList linkedList3 = LinkedList();

  linkedList3.addNode(400);
  linkedList3.addNode(500);
  linkedList3.addNode(600);

  linkedList2.mergeList(linkedList3);

  linkedList2.displayNode();
}
