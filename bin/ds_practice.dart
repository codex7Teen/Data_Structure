// hatch table

class Entry<K, V> {
  K key;
  V value;
  Entry({required this.key, required this.value});
}

class HatchTable<K, V> {
  int length;

  late List<List<Entry<K, V>>> bucket = [];

  HatchTable(this.length) {
    bucket = List.generate(length, (index) => []);
  }

  int hash(K key) {
    return key.hashCode % length;
  }

  // add to hashtable
  void add(K key, V value) {
    int index = hash(key);
    Entry<K, V> entry = Entry(key: key, value: value);

    for(var existingEntry in bucket[index]) {
      if(existingEntry.key == key) {
        existingEntry.value = value;
        break;
      } 
    }
    bucket[index].add(entry);
  }

  // display hashtable
  void display() {
    for(var i=0;i<bucket.length;i++) {
      print('BUCKET: $i');
      for(var entry in bucket[i]) {
        print('entry: ${entry.key}, value: ${entry.value}');
      }
    }
  }

  // delete from hashtable

  void delete(K key) {
    int index = hash(key);

    bucket[index].removeWhere((entry) => entry.key == key);
  }
}

void main() {
  HatchTable table = HatchTable(6);

  
  // Adding key-value pairs to the hash table
  table.add(4, 2);
    table.add(3, 20);
      table.add(2, 20);
        table.add(7, 20);
          table.add(10, 20);
  table.add(6, 20);

  // remove entry from hash table
  table.delete(6);

  // Displaying the contents of the hash table
  table.display();
}