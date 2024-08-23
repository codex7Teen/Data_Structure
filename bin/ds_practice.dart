class Heap {
  List<int> heap = [];

  int parent(int index) => (index - 1) ~/ 2;
  int leftChild(int index) => 2 * index + 1;
  int rightChild(int index) => 2 * index + 2;

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
  void build(List<int> arr) {
    heap = arr;
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      heapifyDown(i);
    }
  }

  void insert(int value) {
    heap.add(value);
    heapifyUp(heap.length - 1);
  }

  int remove() {
    if (heap.isEmpty) {
      throw Exception('Heap is empty');
    }
    int root = heap[0];
    heap[0] = heap.removeLast();
    heapifyDown(0);
    return root;
  }

  void heapifyUp(int index) {
    while (index > 0 && heap[index] < heap[parent(index)]) {
      swap(index, parent(index));
      index = parent(index);
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
}