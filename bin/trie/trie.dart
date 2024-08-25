class Trinode {
  Map<String, Trinode> character = {};
  bool isEndOfWord = false;
}

class Trie {
  Trinode? root = Trinode();

  // Insert a word into the Trie
  void insert(String word) {
    Trinode? temp = root;

    for (var i = 0; i < word.length; i++) {
      String char = word[i];
      temp?.character.putIfAbsent(char, () => Trinode());
      temp = temp?.character[char];
    }
    temp?.isEndOfWord = true;
  }

  // Search for a word in the Trie
  bool search(String word) {
    Trinode? temp = root;
    for (var char in word.split('')) {
      if (!temp!.character.containsKey(char)) {
        return false;
      }
      temp = temp.character[char];
    }
    return temp?.isEndOfWord ?? false;
  }

  // Check if any word in the Trie starts with the given prefix
  bool startsWith(String prefix) {
    Trinode? temp = root;
    for (var char in prefix.split('')) {
      if (!temp!.character.containsKey(char)) {
        return false;
      }
      temp = temp.character[char];
    }
    return true;
  }

  // Delete a word from the Trie
  bool delete(String word) {
    return _deleteHelper(root, word, 0);
  }

  bool _deleteHelper(Trinode? node, String word, int index) {
    if (node == null) {
      return false;
    }

    // If we've reached the end of the word
    if (index == word.length) {
      if (!node.isEndOfWord) {
        return false;
      }
      node.isEndOfWord = false;
      return node.character.isEmpty;
    }

    String char = word[index];
    if (!node.character.containsKey(char)) {
      return false;
    }

    bool shouldDeleteChild = _deleteHelper(node.character[char], word, index + 1);

    if (shouldDeleteChild) {
      node.character.remove(char);
      return node.character.isEmpty && !node.isEndOfWord;
    }

    return false;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert('apple');
  trie.insert('app');
  print(trie.search('apple')); // true
  print(trie.search('app'));   // true
  print(trie.startsWith('app')); // true
  trie.delete('apple');
  print(trie.search('apple')); // false
  print(trie.search('app'));   // true
}
