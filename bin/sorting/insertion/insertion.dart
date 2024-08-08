void main() { 
  List<int> list = [32,5,2,3,645,63,3,44,3,343,4,3,34334,34]; 

  for(int i=1;i<list.length;i++) {
    int current = list[i];
    int j = i - 1;

    while(j >= 0 && list[j] > current) {
      list[j + 1] = list[j];
      j--;
    }
    
    list[j+1] = current;
  }

  print(list);
}