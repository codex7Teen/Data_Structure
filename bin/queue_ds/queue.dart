class Node {
  int data;
  Node? next;

  Node(this.data);
}

class Queue {
  
  Node? front;
  Node? rear;

  //! display queue
  void displayNode() {
    Node? temp = front;

    if(front == null) {
      print('the queue is empty. nothing to display');
      return;
    } 
    while(temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  //! enque (adding)
  void enQueue(int data) {
    Node newNode = Node(data);

    if(front == null) {
      front = newNode;
      rear = newNode;
      return;
    }

    rear!.next = newNode;
    rear = newNode;
  }

  //! deque (removing)
  void deQueue() {
    if(front == null) {
      print('the queue is empty. nothing to deque');
      return;
    }
    front = front!.next;

    if(front == null) {
      rear  = null;
    }
  }

}

void main() {
  Queue queue = Queue();

  queue.enQueue(10);
  queue.enQueue(20);
  queue.enQueue(30);
  queue.enQueue(40);
  queue.enQueue(50);

  queue.deQueue();

  queue.displayNode();
}