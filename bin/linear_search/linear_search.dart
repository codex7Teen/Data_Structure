void main() {
  List<int> nums = [23,324,123,1,2,4,29,42];
  int target = 4;

  for (var i=0;i<nums.length;i++) {
    if (nums[i] == target) {
      print('Target found at position ${i+1}');
    }
  }
}

// Time complexity is O(N) IN THE WORST CASE AND ALSO O(1) IN BEST CASE
