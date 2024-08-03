selection(List list) {
  for (int i = 0; i < list.length; i++) {
    int min = i;
    for (int j = 0; j < list.length; j++) {
      if (list[min] > list[j]) {
        min = j;
      }
    }
    int temp = list[min];
    list[min] = list[i];
    list[i] = temp;
  }
}

void main() {
 print (selection([1, 2, 3, 4, 0, -7]));
}