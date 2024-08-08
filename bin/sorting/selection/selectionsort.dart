//! Selection sort
void main() {
  List<int> list = [4,5,2,34,4,6,23,3,45,4235,345];

  for(var i=0;i<list.length - 1;i++) {
    int min = i;

    for(var j=i+1;j<list.length;j++) {
      if(list[j] < list[min]) {
        min = j;
      }
    }
    int temp = list[min];
    list[min] = list[i];
    list[i] = temp;

  }

  print(list);
}