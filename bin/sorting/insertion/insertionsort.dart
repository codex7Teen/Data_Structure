
insertionSort(List<int> list) {
  for (int i = 1; i < list.length; i++) {
    int current = list[i];
    int j = i - 1;
    while (j >= 0 && list[j] > current) {
      list[j + 1] = list[j];
      j--;
    }
    list[j + 1] = current;
  }
  return list;
}

void main() {
  print(insertionSort([2, 7, 0, 45, 72, 1]));
}