void main(){
  List<int>list=[3,7,5,8,9];
  var temp=0;
  for(var i=0;i<list.length;i++)
  {
    for(var j=1;j<list.length-i;j++){
      if (list[j-1]>list[j]) {
        temp=list[j-1];
        list[j-1]=list[j];
        list[j]=temp;
        
      } 
    }
  }
  print(list);
}