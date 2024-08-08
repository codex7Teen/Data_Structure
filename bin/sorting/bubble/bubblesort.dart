void main() {
  List<int> list = [5,2,7,345,65];

  var temp = 0;

  for(var i=0;i<list.length - 1;i++) {
    for(var j=0;j<list.length - 1 - i;j++) {
      if(list[j] > list[j+1]) {
        temp = list[j];
        list[j] = list[j+1];
        list[j+1] = temp;
      }
    }
  }
  print(list);
}