void main() {
  print(isPalindrome('racecar')); // Should print: true
  print(isPalindrome('hello'));   // Should print: false
}

bool isPalindrome(String word) {
  return helper(word);
}

bool helper(String word) {
  // If the string is empty or has only one character, it's a palindrome
  if (word.length <= 1) {
    return true; // Base case: single character or empty string is a palindrome
  } else {
    // Check if the first and last characters are the same
    if (word[0] == word[word.length - 1]) {
      // If they are, check the substring that excludes the first and last characters
      return helper(word.substring(1, word.length - 1));
    } else {
      // If they are not, it's not a palindrome
      return false;
    }
  }
}