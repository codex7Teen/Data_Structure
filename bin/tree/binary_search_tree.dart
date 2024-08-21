class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinarySearchTree {
  Node? root;



  //! INSERT NODE IN TREE
  void insertNode(int data) {
    Node? newNode = Node(data);
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





  //! CHECK CONTAINS IN TREE
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






  //! DELETE NODE IN TREE
  void remove(int data) {
    removerHelper(data, root!, null);
  }

  void removerHelper(int data, Node? currentNode, Node? parentNode) {
    while (currentNode != null) {
      if (data < currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        //*if value found
        // removes if both left and right of a node is present
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = getMinValueHelper(currentNode.right);
          removerHelper(currentNode.data, currentNode.right, currentNode);
        } else {
          // removes if parent node is null
          if (parentNode == null) {
            if (currentNode.right == null) {
              root = currentNode.left;
            } else {
              root = currentNode.right;
            }
          } else {
            // removes if the left node is only present
            if (parentNode.left == currentNode) {
              if (currentNode.right == null) {
                parentNode.left = currentNode.left;
              } else {
                parentNode.left = currentNode.right;
              }
            } else {
              // removes if the right node is only present 
              if (currentNode.right == null) {
                parentNode.right = currentNode.left;
              } else {
                parentNode.right = currentNode.right;
              }
            }
          }
        } 
        break;
      }
    }
  }

  int getMinValueHelper(Node? currentNode) {
    if (currentNode?.left == null) {
      return currentNode!.data;
    } else {
      return getMinValueHelper(currentNode?.left);
    }
  }
}

//! RUNNNNNNNNXXXXXXX

void main() {
  BinarySearchTree tree = BinarySearchTree();

  tree.insertNode(10);
  tree.insertNode(5);

  tree.remove(5);

  print(tree.checkContains(5));
}
