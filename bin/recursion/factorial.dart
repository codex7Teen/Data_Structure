void main() {
  var dd = fact(5);
  print(dd);
}

int fact(int n) {
if (n == 1) {
    return 1;
  } else {
    return n * fact(n - 1);
  }
}