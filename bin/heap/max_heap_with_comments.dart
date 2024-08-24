//? MAX HEAP IS REALLY EASY COMPARED TO MIN HEAP. ONLY DIFFERENCE IS JUST PLACE THE GREATER THAN ICON INSTEAD OF LESS THAN
//? AND ALSO SET A LARGEST VARIABLE INSTEAD OF SMALLEST

class Heap {
  List<int> heap = [];

  // Function to calculate the parent index of a given node.
  int parent(int index) => (index - 1) ~/ 2;

  // Function to calculate the left child index of a given node.
  int leftChild(int index) => 2 * index + 1;

  // Function to calculate the right child index of a given node.
  int rightChild(int index) => 2 * index + 2;

  // Function to swap two elements in the heap.
  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  // Function to print the current state of the heap.
  void printHeap() {
    print(heap);
  }
}

//! MAX HEAP

class MaxHeap extends Heap {
  // Function to build the heap from an array.
  void build(List<int> arr) {
    heap = arr;
    // Start heapifying from the last parent node down to the root.
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      heapifyDown(i);
    }
  }

  // Function to insert a new element into the heap.
  void insert(int value) {
    heap.add(value); // Add the new element to the end of the heap.
    heapifyUp(heap.length -
        1); // Ensure the heap property is maintained by moving the element up.
  }

  // Function to remove and return the largest element (root) from the heap.
  int remove() {
    if (heap.isEmpty) {
      throw Exception('Heap is empty'); // Handle empty heap case.
    }
    int root = heap[0]; // Get the root element (largest in max heap).
    heap[0] =
        heap.removeLast(); // Replace root with the last element in the heap.
    heapifyDown(0); // Restore heap property by moving the new root down.
    return root; // Return the removed root element.
  }

  // Function to restore the heap property by moving the element up.
  void heapifyUp(int index) {
    while (index > 0 && heap[index] > heap[parent(index)]) {
      swap(
          index,
          parent(
              index)); // Swap if the current element is greater than its parent.
      index = parent(index); // Move to the parent index.
    }
  }

  // Function to restore the heap property by moving the element down.
  void heapifyDown(int index) {
    int largest = index; // Assume the current index is the largest.
    int left = leftChild(index); // Get the left child index.
    int right = rightChild(index); // Get the right child index.

    // If the left child exists and is greater than the current largest, update largest.
    if (left < heap.length && heap[left] > heap[largest]) {
      largest = left;
    }

    // If the right child exists and is greater than the current largest, update largest.
    if (right < heap.length && heap[right] > heap[largest]) {
      largest = right;
    }

    // If the largest element is not the current index, swap and continue heapifying down.
    if (largest != index) {
      swap(index, largest);
      heapifyDown(largest);
    }
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();
  maxHeap
      .build([5, 3, 8, 4, 1, 2]); // Build the max heap from the initial array.
  maxHeap.printHeap(); // Should print the heap in max-heap order.

  maxHeap.insert(10); // Insert the value 10 into the max heap.
  maxHeap.printHeap(); // After inserting 10, print the heap.

  print(maxHeap.remove()); // Removes and returns the largest element (10).
  maxHeap.printHeap(); // Print the heap after removal.
}
