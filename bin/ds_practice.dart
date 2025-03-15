class Heap {
  List<int> heap = [];

  int parent(int index) => (index - 1) ~/ 2;
  int leftChild(int index) => (2 * index) + 1;
  int rightChild(int index) => (2 * index) + 2;

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
    for (var i = parent(list.length - 1); i >= 0; i--) {
      heapifyDown(i);
    }
  }

  void heapifyDown(int index) {
    int smallest = index;
    int left = leftChild(index);
    int right = rightChild(index);

    if (left < heap.length && heap[left] < heap[smallest]) {
      smallest = left;
    }

    if (right < heap.length && heap[right] < heap[smallest]) {
      smallest = right;
    }

    if (smallest != index) {
      swap(index, smallest);
      heapifyDown(smallest);
    }
  }

  void heapifyUp(int index) {
    while(index > 0 && heap[parent(index)] > heap[index]) {
      swap(index, parent(index));
      index = parent(index);
    }
  }
}

void main() {
  MinHeap heap = MinHeap();

  heap.buildHeap([7, 10, 3, 6, 1, 5]);

  heap.printHeap();
}
