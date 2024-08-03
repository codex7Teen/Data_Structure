void main() {
  isPrimeHelper(15);
}

void isPrimeHelper(int num) {
  print(isPrime(num, num - 1));
}

bool isPrime(int num, int currnt, [prime = true]) {
  if (currnt == 1) {
    return true;
  } else {
    return prime && isPrime(num, currnt - 1, num % currnt != 0);
  }
}
