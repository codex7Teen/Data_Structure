class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BinarySearchTree {

  Node? root;

  void insert(int data) {
    Node newNode = Node(data);
     Node? currentNode = root;

     if(currentNode == null) {
      root = newNode;
      return;
     }

     while(true) {
      if(newNode.data < currentNode!.data) {
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


  bool checkContains(int data) {
    Node? currentNode =  root;

    while(currentNode != null) {
      if(data < currentNode.data) {
        currentNode = currentNode.left;
      } else if(data > currentNode.data) {
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

  tree.insert(40);
  tree.insert(20);
  tree.insert(60);

  print(tree.checkContains(60));



}