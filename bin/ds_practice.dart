class Heap {
  List<int> heap = [];

  int parent(int index) => (index - 1) ~/2;
  int left(int index) => (2* index) + 1;
  int right(int index) => (2*index) + 2;

  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  void printHeap() {
    print(heap);
  }
}

class MinHeap extends Heap {
  
  void buildHeap(List<int> list) {
    heap = list;

    for(var i=parent(heap.length - 1); i>= 0;i--) {
      heapifyDown(i);
    } 
  }

  void heapifyDown(int index) {
    int smallest = index;

    int leftChild = left(index);
    int rightChild = right(index);

    if(leftChild < heap.length && heap[leftChild] < heap[smallest]) {
      smallest = leftChild;
    }

    if(rightChild < heap.length && heap[rightChild] < heap[smallest]) {
      smallest = rightChild;
    }

    if(smallest != index) {
      swap(index, smallest);
      heapifyDown(smallest);
    }
  }

  // void insert
  void insert(int data) {
    heap.add(data);

    heapifyUp(heap.length - 1);
  }

  void heapifyUp(int index) {
    while(index > 0 && heap[index] < heap[parent(index)]) {
      swap(index, parent(index));
      index = parent(index);
    }
  }

  void remove() {
    if(heap.isEmpty) {
      return;
    }

    heap[0] = heap.removeLast();
    heapifyDown(0);
  }
}

void main() {
    MinHeap minHeap = MinHeap();
  minHeap.buildHeap([5, 3, 8, 4, 2]);
  minHeap.printHeap();
}