class Node {
  int data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head;

//! Adding node to linked list
  void addNode(int data) {
    Node newNode = Node(data);
    Node? temp = head;

    if(head == null) {
      head = newNode;
      return;
    } else {
      while(temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }




  //! display linked list
  void display() {
    if(head == null) {
      print('Listed list is empty');
      return;
    }

    Node? temp = head;

    while(temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }





  //! delete node
  void delteNode(int data) {
    Node? temp = head;

    if(head == null) {
      return;
    }

    if(head!.data == data) {
      head = head!.next;
      return;
    }

    Node? prev;

    while(temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }
    prev!.next = temp!.next;

  }









 //! inserting a node after
  void insertNodeAfter(int data, int after) {
    Node newNode = Node(data);
    Node? temp = head;

    while(temp != null && temp.data != after) {
      temp = temp.next;
    }

    newNode.next = temp!.next;
    temp.next = newNode;
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

  // //! inserting a node after a node
  // void insertNodeAfter(int after, int data) {
  //   Node newValue = Node(data);
  //   Node? temp = head;
  //   bool found = false;

  //   while (temp != null) {
  //     if (temp.data == after) {
  //       found = true;
  //       newValue.next = temp.next;
  //       temp.next = newValue;
  //       break;
  //     }
  //     temp = temp.next;
  //   }

  //   if (!found) {
  //     print('The node to insert after is not found!');
  //   }
  // }

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

 linkedList.insertNodeAfter(100, 30);

 linkedList.display();

}
