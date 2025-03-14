void main() {
  List<int> list = [32, 5, 2, 3, 645, 63, 3, 44];

  for (int i = 1; i < list.length; i++) {
    int temp = list[i];
    int j = i - 1;

    while (j >= 0 && list[j] > temp) {
      list[j + 1] = list[j];
      j--;
    }

    list[j + 1] = temp;
  }

  print(list);
}
