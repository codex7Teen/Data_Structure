class TrieNode {
  Map<String, TrieNode> character = {};

  bool isEndOfWord = false;
}

class Trie {
  TrieNode? root = TrieNode();

  // insert word in trie
  void insertWord(String word) {
    TrieNode? temp = root;

    for(var i=0;i<word.length;i++) {
      String char = word[i];

      temp!.character.putIfAbsent(char, () => TrieNode());

      temp = temp.character[char];
    }
    temp?.isEndOfWord = true;
  }

  // search word in trie
  bool searchWord(String word) {
    TrieNode? temp = root;

    for(var char in word.split('')) {
      if(!temp!.character.containsKey(char)) {
        return false;
      }
      temp = temp.character[char];
    }
    return temp?.isEndOfWord ?? false;
  }

  // saerch prefix

  bool searchPrefix(String word) {
    TrieNode? temp = root;

    for(var char in word.split('')) {
      if(!temp!.character.containsKey(char)) {
        return false;
      }
      temp = temp.character[char];
    }
    return true;
  }

}

void main() {
  Trie trie = Trie();

  trie.insertWord('dennis');

  print(trie.searchPrefix('denniss'));
}