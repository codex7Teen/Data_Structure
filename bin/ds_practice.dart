class Heap {
  List<int> heap = [];

  int parent(int index)=> (index - 1) ~/2;
  int leftChild(int index) => (2*index) + 1;
  int rightChild(int index) => (2*index) + 2;

  void swap(int i, int j) {
    int temp = heap [i];
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
    for(var i= parent(heap.length - 1);i>=0;i--) {
      heapifyDown(i);
    }
  }


  void heapifyDown(int index) {
    int smallest = index;
    int left = leftChild(index);
    int right = rightChild(index);

    while(left < heap.length && heap[left] < heap[smallest]) {
      smallest = left;
    }

    while(right < heap.length && heap[right] < heap[smallest]) {
      smallest = right;
    }

    if(index != smallest) {
      swap(index, smallest);
      heapifyDown(smallest);
    }
  }

  void insertIntoHeap(int data) {
    heap.add(data);
    heapifyUp(heap.length - 1);
  }

  void heapifyUp(int index) {
    while(index > 0 && heap[index] < heap[parent(index)]) {
      swap(index, parent(index));
      index = parent(index);
    }
  }

  void deleteFromHeap() {
    if(heap.isEmpty) {
      return;
    }

    heap[0] = heap.removeLast();
    heapifyDown(0);
  }

}

void main() {
  MinHeap minHeap = MinHeap();

  minHeap.buildHeap([4,6,2,8,3,9]);

  minHeap.insertIntoHeap(1);

  minHeap.deleteFromHeap();

  minHeap.printHeap();
}