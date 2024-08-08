List<int> binary(List<int> list, int n) {
  if (n <= 1) {
    return list;
  }
  for (var i = 0; i < n - 1; i++) {
    if (list[i] > list[i + 1]) {
      int temp = list[i];
      list[i] = list[i + 1];
      list[i + 1] = temp;
    }
  }
  return binary(list, n - 1);
}

void main() {
  List<int> list1 = [4, 3, 2, 5, 1];
  print(binary(list1, list1.length));
}