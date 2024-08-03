// Entry class to represent a key-value pair
class Entry<K, V> {
  K key;
  V value;

  Entry({required this.key, required this.value});
}

class HashTable<K, V> {
  // The number of buckets in the hash table
  int length;

  // List of buckets, where each bucket is a list of entries
  late List<List<Entry<K, V>>> bucket = [];

  // Constructor to initialize the hash table with a specified number of buckets
  HashTable({required this.length}) {
    bucket = List.generate(length, (index) => []);
  }

  // Hash function to calculate the index for a given key
  int hash(K key) {
    return key.hashCode % length;
  }

  //! Method to add a key-value pair to the hash table
  void add(K key, V value) {
    int index = hash(key);
    Entry<K, V> entry = Entry(key: key, value: value);

    // Check if the key already exists in the bucket
    for (var existingEntry in bucket[index]) {
      if (existingEntry.key == key) {
        existingEntry.value = value; // Update the value if the key exists
        return;
      }
    }

    // Add the new entry if the key does not exist
    bucket[index].add(entry);
  }

  //! Method to remove an entry from the hash table
  void removeEntry(K key) {
    int index = hash(key);

    bucket[index].removeWhere((entry) => entry.key == key);
  }

  //! Method to display all key-value pairs in the hash table
  void display() {
    for (var i = 0; i < bucket.length; i++) {
      print('Bucket ${i + 1}:');
      for (var entry in bucket[i]) {
        print('${entry.key}: ${entry.value}');
      }
    }
  }
}

void main() {
  // Creating an instance of the HashTable with 2 buckets
  HashTable<int, int> hashTable = HashTable(length: 1);

  // Adding key-value pairs to the hash table
  hashTable.add(4, 2);
  hashTable.add(6, 20);

  // remove entry from hash table
  hashTable.removeEntry(6);

  // Displaying the contents of the hash table
  hashTable.display();
}
