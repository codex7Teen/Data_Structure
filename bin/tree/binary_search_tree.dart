class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  //! InsertNode in tree
  void insertNode(int data) {
    Node newNode = Node(data);
    Node? currentNode = root;

    if (currentNode == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (newNode.data < currentNode!.data) {
        if (currentNode.left == null) {
          currentNode.left = newNode;
          break;
        } else {
          currentNode = currentNode.left;
        }
      } else {
        if (currentNode.right == null) {
          currentNode.right = newNode;
          break;
        } else {
          currentNode = currentNode.right;
        }
      }
    }
  }

  //! check if Node contains in tree
  bool checkContains(int data) {
    Node? currentNode = root;

    while (currentNode != null) {
      if (data < currentNode.data) {
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        currentNode = currentNode.right;
      } else {
        return true;
      }
    }
    return false;
  }
}

void main() {
  BinarySearchTree tree = BinarySearchTree();

  tree.insertNode(40);
  tree.insertNode(20);
  tree.insertNode(50);

  print(tree.checkContains(50));
}
