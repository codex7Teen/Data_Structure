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

//! MAX HEAP

class MaxHeap extends Heap {
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
    while (index > 0 && heap[index] > heap[parent(index)]) {
      swap(index, parent(index));
      index = parent(index);
    }
  }

  void heapifyDown(int index) {
    int largest = index;
    int left = leftChild(index);
    int right = rightChild(index);

    if (left < heap.length && heap[left] > heap[largest]) {
      largest = left;
    }

    if (right < heap.length && heap[right] > heap[largest]) {
      largest = right;
    }

    if (largest != index) {
      swap(index, largest);
      heapifyDown(largest);
    }
  }
}


void main() {

  MaxHeap maxHeap = MaxHeap();
  maxHeap.build([5, 3, 8, 4, 1, 2]);
  maxHeap.printHeap(); // Should print the heap in max-heap order

  maxHeap.insert(10);
  maxHeap.printHeap(); // After inserting 10

  print(maxHeap.remove()); // Removes and returns the largest element (10)
  maxHeap.printHeap(); // Heap after removal

}