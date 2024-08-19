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
      return middle + 1;
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

void main() {
  //  the binary search function
  print(searchBinary([2, 3, 4, 5], 3)); // Output: 5
  normalBinary([2, 3, 4, 5], 3);
}

void normalBinary(List<int> list, int search) {
  int start = 0;
  int end = list.length - 1;
  while (start <= end) {
    int mid = (start + end) ~/ 2;
    if (list[mid] == search) {
      print('found at pos : ${mid + 1}');
      return;
    } else if (list[mid] > search) {
      start = mid + 1;
    } else {
      end = mid;
    }
  }
  print('not found');
}
