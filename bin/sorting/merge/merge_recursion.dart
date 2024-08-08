List<int> mergesort(List<int> list) {
  // Base case: if the list is of length 1 or less, return it
  if (list.length <= 1) {
    return list;
  }

  // Find the middle index
  int middle = list.length ~/ 2;

  // Split the list into left and right sublists
  List<int> left = list.sublist(0, middle); 
  List<int> right = list.sublist(middle);

  // Recursively sort and merge the sublists
  return merge(mergesort(left), mergesort(right));
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int leftIndex = 0;
  int rightIndex = 0;

  // Merge the two sublists
  while (leftIndex < left.length && rightIndex < right.length) {
    if (left[leftIndex] < right[rightIndex]) {
      result.add(left[leftIndex]);
      leftIndex++;
    } else {
      result.add(right[rightIndex]);
      rightIndex++;
    }
  }

  // Add any remaining elements from the left sublist
  result.addAll(left.sublist(leftIndex));

  // Add any remaining elements from the right sublist
  result.addAll(right.sublist(rightIndex));

  // Return the merged list
  return result;
}

void main() {
  // Test the mergesort function and print the result
  print(mergesort([88, 66, 44, 55, 22]));
}