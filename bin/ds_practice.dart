class TrieNode {
  Map<String, TrieNode> character = {};
  bool endOfCharacter = false;
}

class Trie {
  TrieNode root = TrieNode();

//! insert
  void insert(String word) {
    TrieNode? temp = root;

    for(var i=0;i<word.length;i++) {
      var char = word[i];
      temp?.character.putIfAbsent(char, () => TrieNode());
      temp = temp?.character[char];
    }
    temp?.endOfCharacter = true;
  }

//! search 
bool search(String word) {
  TrieNode? temp = root;

  for(var char in word.split('')) {
    if(!temp!.character.containsKey(char)) {
      return false;
    }
    temp = temp.character[char];
  } 
  return temp?.endOfCharacter ?? false;
} 

//! check preffix
bool checkPrefix(String prefix) {
  TrieNode? temp = root;

  for(var char in prefix.split('')) {
    if (!temp!.character.containsKey(char)) {
      return false;
    }
    temp = temp.character[char];
  }
  return true;
}

//! delete 


}

void main() {
  Trie trie = Trie();
  
  trie.insert('dennis');
  trie.insert('abisek');

  
}