List<int> quicksort(List<int> list) {
  // Base case: if the list has 1 or no elements, it's already sorted
  if (list.length <= 1) {
    return list;
  }

  // Choosing the pivot element
  int pivot = list[list.length ~/ 2];

  // Lists to hold elements less than, greater than, and equal to the pivot
  List<int> left = [];
  List<int> right = [];
  List<int> equal = [];

  // Partition the list into left, right, and equal lists
  for (var i in list) {
    if (i < pivot) {
      left.add(i);
    } else if (i > pivot) {
      right.add(i);
    } else {
      equal.add(i);
    }
  }

  // Recursively sort the left and right lists, and combine them with the equal list
  return [...quicksort(left), ...equal, ...quicksort(right)];
}

void main() {
  // Testing the quicksort function
  print(quicksort([2, 45, 6, 1, 2]));
}