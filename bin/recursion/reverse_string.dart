void main(){
  print(reverseString('car'));
}
reverseString(String word){
  //to do actual reversing
  return helper1(word);
}

helper1(String word) {
  //check cheyu 1,0 athil korav aanengil reverse cheyandelo
  if(word.length  <=1){
    return word;
  } else {
    //1-nekaal length undengil 
    return helper1(word.substring(1)) + word[0];
  }
}




