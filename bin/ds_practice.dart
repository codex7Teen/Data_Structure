// This class represents a Max-Heap implementation.
class Heaper {
  // This method is responsible for building the heap and then sorting the array.
  void insert(List<int> arr) {
    int n = arr.length;
    
    // Step 1: Build the heap.
    // Start from the last non-leaf node and heapify each node.
    for (var i = (n ~/ 2) - 1; i >= 0; i--) {
      heapfyup(arr, n, i);
    }

    // Step 2: Sort the array using heap sort.
    // Extract elements from the heap one by one, placing them at the end of the array.
    for (var i = n - 1; i >= 0; i--) {
      // Swap the root (largest element) with the last element.
      int temp = arr[0];
      arr[0] = arr[i];
      arr[i] = temp;
      
      // Heapify the reduced heap to maintain the heap property.
      heapfyup(arr, i, 0);
    }
  }

  // This method is responsible for maintaining the heap property.
  // It ensures the largest element is at the root in the subtree rooted at index `i`.
  void heapfyup(List<int> arr, int n, int i) {
    int largest = i;  // Assume the root is the largest.
    int left = 2 * largest + 1;  // Left child index.
    int right = 2 * largest + 2; // Right child index.

    // If the left child exists and is greater than the current largest, update largest.
    if (left < n && arr[left] > arr[largest]) {
      largest = left;
    }
    // If the right child exists and is greater than the current largest, update largest.
    if (right < n && arr[right] > arr[largest]) {
      largest = right;
    }

    // If the largest element is not the root, swap them and continue heapifying.
    if (largest != i) {
      int temp = arr[i];
      arr[i] = arr[largest];
      arr[largest] = temp;
      
      // Recursively heapify the affected subtree.
      heapfyup(arr, n, largest);
    }
  }
}

void main() {
  // Create an instance of the heaper class.
  Heaper he = Heaper();

  // Define an array to be heapified and sorted.
  List<int> arr = [10, 11, 12, 6, 5, 7];
  
  // Call the insert method to sort the array using heap sort.
  he.insert(arr);
  
  // Print the sorted array.
  print(arr);
}
