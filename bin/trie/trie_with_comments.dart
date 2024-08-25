class Trinode {
  // Each Trinode object will have a map that holds references to its child nodes.
  // The keys in the map are characters, and the values are Trinode objects.
  Map<String, Trinode> character = {};

  // This boolean flag indicates whether the current node marks the end of a word.
  bool isEndOfWord = false;
}

class Trie {
  // The root node of the Trie, initialized as an empty Trinode.
  Trinode? root = Trinode();

  // Insert a word into the Trie
  void insert(String word) {
    // Start from the root node.
    Trinode? temp = root;

    // Iterate through each character in the word.
    for (var i = 0; i < word.length; i++) {
      String char = word[i];

      // If the character doesn't exist as a child, add it.
      temp?.character.putIfAbsent(char, () => Trinode());

      // Move to the next node corresponding to the character.
      temp = temp?.character[char];
    }
    // Mark the last node as the end of a word.
    temp?.isEndOfWord = true;
  }

  // Search for a word in the Trie
  bool search(String word) {
    // Start from the root node.
    Trinode? temp = root;

    // Iterate through each character in the word.
    for (var char in word.split('')) {
      // If the character doesn't exist in the current node, return false.
      if (!temp!.character.containsKey(char)) {
        return false;
      }
      // Move to the next node corresponding to the character.
      temp = temp.character[char];
    }
    // Return true if the last node marks the end of the word.
    return temp?.isEndOfWord ?? false;
  }

  // Check if any word in the Trie starts with the given prefix
  bool startsWith(String prefix) {
    // Start from the root node.
    Trinode? temp = root;

    // Iterate through each character in the prefix.
    for (var char in prefix.split('')) {
      // If the character doesn't exist in the current node, return false.
      if (!temp!.character.containsKey(char)) {
        return false;
      }
      // Move to the next node corresponding to the character.
      temp = temp.character[char];
    }
    // If all characters exist, return true.
    return true;
  }

  // Delete a word from the Trie
  bool delete(String word) {
    // Call the helper function to delete the word, starting from the root and the first character.
    return _deleteHelper(root, word, 0);
  }

  // Helper function to delete a word from the Trie recursively
  bool _deleteHelper(Trinode? node, String word, int index) {
    // Base case: if the node is null, return false (word not found).
    if (node == null) {
      return false;
    }

    // If we've reached the end of the word
    if (index == word.length) {
      // If the word isn't marked as an end, return false (word not found).
      if (!node.isEndOfWord) {
        return false;
      } 
      // Unmark the end of the word.
      node.isEndOfWord = false;
      
      // If the node has no children, return true (indicating this node can be deleted).
      return node.character.isEmpty;
    }

    // Get the character at the current index.
    String char = word[index];

    // If the character doesn't exist in the current node, return false (word not found).
    if (!node.character.containsKey(char)) {
      return false;
    }

    // Recursively delete the word in the Trie.
    bool shouldDeleteChild = _deleteHelper(node.character[char], word, index + 1);

    // If the child should be deleted, remove it from the current node's map.
    if (shouldDeleteChild) {
      node.character.remove(char);

      // Return true if the current node has no other children and isn't the end of another word.
      return node.character.isEmpty && !node.isEndOfWord;
    }

    // If the child shouldn't be deleted, return false.
    return false;
  }
}

void main() {
  // Create a new Trie object.
  Trie trie = Trie();

  // Insert words into the Trie.
  trie.insert('apple');
  trie.insert('app');

  // Search for words in the Trie.
  print(trie.search('apple')); // true
  print(trie.search('app'));   // true

  // Check if any word starts with the given prefix.
  print(trie.startsWith('app')); // true

  // Delete a word from the Trie.
  trie.delete('apple');

  // Search for the word again to verify deletion.
  print(trie.search('apple')); // false
  print(trie.search('app'));   // true
}
