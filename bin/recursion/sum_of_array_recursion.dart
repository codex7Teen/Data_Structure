void main() {
  List<int> array = [1, 2, 3, 3, 2, 2];
  print(findSum(array, array.length - 1));
}

int findSum(List<int> array, int index) {
  // Base case: if index is less than 0, return 0
  if (index < 0) {
    return 0;
  }
  // Recursive case: return the current element plus the sum of the rest
  return array[index] + findSum(array, index - 1);
}