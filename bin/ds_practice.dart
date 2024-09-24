
void main() {
  //  the binary search function
  print(searchBinary([2, 3, 4, 5], 5)); // Output: 5
}

// Function to initiate the binary search
int? searchBinary(List<int> list, int targetValue) {
  return _binarySearchHelper(list, targetValue, 0, list.length - 1);
}

// Helper function to perform binary search recursively
int? _binarySearchHelper(List<int> list, int targetValue, int start, int end) {
  if (start <= end) {
    int middle = (start + end) ~/ 2;
    
    if (list[middle] == targetValue) {
      // Target value found
      return targetValue;
    } else if (list[middle] < targetValue) {
      // Search in the right half
      return _binarySearchHelper(list, targetValue, middle + 1, end);
    } else {
      // Search in the left half
      return _binarySearchHelper(list, targetValue, start, middle - 1);
    }
  }
  
  return null;
}