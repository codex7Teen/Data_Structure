class Heap {
  // List to store heap elements.
  List<int> heap = [];

  // Function to calculate the parent index of a given index.
  int parent(int index) => (index - 1) ~/ 2;

  // Function to calculate the left child index of a given index.
  int leftChild(int index) => 2 * index + 1;

  // Function to calculate the right child index of a given index.
  int rightChild(int index) => 2 * index + 2;

  // Function to swap two elements in the heap.
  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  // Function to print the heap.
  void printHeap() {
    print(heap);
  }
}

//! MIN HEAP

class MinHeap extends Heap {
  // Function to build the heap from an unsorted array.
  void build(List<int> arr) {
    heap = arr; // Initialize heap with the array elements.
    // Heapify all non-leaf nodes starting from the last parent node.
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      heapifyDown(i);
    }
  }

  // Function to insert a new element into the heap.
  void insert(int value) {
    heap.add(value); // Add the new element to the end of the heap.
    heapifyUp(heap.length - 1); // Ensure the heap property is maintained by moving the element up.
  }

  // Function to remove and return the smallest element (root) from the heap.
  int remove() {
    if (heap.isEmpty) {
      throw Exception('Heap is empty'); // Handle empty heap case.
    }
    int root = heap[0]; // Store the root element to return it later.
    heap[0] = heap.removeLast(); // Replace root with the last element and remove the last element.
    heapifyDown(0); // Ensure the heap property is maintained by moving the new root down.
    return root; // Return the smallest element.
  }

  // Function to maintain the heap property by moving an element up.
  void heapifyUp(int index) {
    // Move the element up until the heap property is satisfied.
    while (index > 0 && heap[index] < heap[parent(index)]) {
      swap(index, parent(index)); // Swap with the parent if the element is smaller.
      index = parent(index); // Move to the parent index.
    }
  }

  // Function to maintain the heap property by moving an element down.
  void heapifyDown(int index) {
    int smallest = index;
    int left = leftChild(index);
    int right = rightChild(index);

    // Find the smallest among the node and its children.
    if (left < heap.length && heap[left] < heap[smallest]) {
      smallest = left;
    }

    if (right < heap.length && heap[right] < heap[smallest]) {
      smallest = right;
    }

    // If the smallest is not the current node, swap and continue heapifying down.
    if (smallest != index) {
      swap(index, smallest);
      heapifyDown(smallest);
    }
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.build([5, 3, 8, 4, 1, 2]); // Build a min-heap from an unsorted array.
  minHeap.printHeap(); // Should print the heap in min-heap order.

  minHeap.insert(0); // Insert a new element (0) into the heap.
  minHeap.printHeap(); // After inserting 0, print the updated heap.

  print(minHeap.remove()); // Removes and returns the smallest element (0).
  minHeap.printHeap(); // Print the heap after the removal.
}
