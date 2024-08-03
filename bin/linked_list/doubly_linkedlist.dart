class Node {
  int data;
  Node? next;
  Node? prev;

  Node(this.data);
}

class DoublyLinkedList {
  Node? head;

  //! add node
  void addNode(int data) {
    Node newValue = Node(data);
    if (head == null) {
      head = newValue;
    } else {
      Node temp = head!;
      while (temp.next != null) {
        temp = temp.next!;
      }
      temp.next = newValue;
      newValue.prev = temp;
    }
  }

  //! delete node
  void deleteNode(int data) {
    Node? temp = head;

    if (temp != null && temp.data == data) {
      head = temp.next;
      if (head != null) {
        head!.prev = null;
      }
      return;
    }

    while (temp != null && temp.data != data) {
      temp = temp.next;
    }

    if (temp == null) {
      print('data not available to delete');
      return;
    }

    if (temp.next != null) {
      temp.next!.prev = temp.prev;
    }

    if(temp.prev != null) {
      temp.prev!.next = temp.next;
    }
  }

  //! insert before a node
  void insertNodeBefore(int nodeBefore, int data) {
    Node newNode = Node(data);
    if (head == null) {
      print('linked list is empty!!!');
    }

    if (head!.data == nodeBefore) {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
      return;
    }

    Node? temp = head;
    bool found = false;

    while (temp!.next != null) {
      if (temp.next!.data == nodeBefore) {
        found = true;
        newNode.next = temp.next;
        newNode.prev = temp;
        temp.next!.prev = newNode;
        temp.next = newNode;
        break;
      }
      temp = temp.next;
    }

    if (!found) {
      print('value to insert before, not found!!!');
    }
  }

  //! insert after a node
  void insertAfterNode(int nodeAfter, int data) {
    Node newNode = Node(data);
    Node? temp = head;
    bool found = false;

    while (temp != null) {
      if (temp.data == nodeAfter) {
        found = true;
        newNode.prev = temp;
        newNode.next = temp.next;
        temp.next = newNode;
        temp.next!.prev = newNode;
        break;
      }
      temp = temp.next;
    }

    if (!found) {
      print('node to insert after is not found');
      return;
    }
  }

  //! merge linked list
  void mergeLists(DoublyLinkedList newlist) {

    Node? temp = head;
    
    if(head == null) {
      head = newlist.head;
    } else {

      while(temp?.next != null) {
        temp = temp?.next;
      }
      temp?.next = newlist.head;
      newlist.head?.prev = temp;
    }
  }

  //! display nodes
  void displayNode() {
    Node? temp = head;
    if (temp == null) {
      print('Linked list is empty');
      return;
    }

    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main() {
  DoublyLinkedList linkedList = DoublyLinkedList();

  linkedList.addNode(100);
  linkedList.addNode(200);
  linkedList.addNode(300);
  print('Linked list: ');
  linkedList.displayNode();

  linkedList.insertAfterNode(300, 10);
  print("List after inserting");
  linkedList.displayNode();

}
