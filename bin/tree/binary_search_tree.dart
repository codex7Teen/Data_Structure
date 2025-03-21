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
      // traverses through the left tree
      if (data < currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.left;
        // traverses through the right tree
      } else if (data > currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        // *if value found
        // removes if both left and right of a node is present
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = getMinValueHelper(currentNode.right);
          removerHelper(currentNode.data, currentNode.right, currentNode);
        } else {
          // Case: The node to be deleted is the root node
          if (parentNode == null) {
            if (currentNode.right == null) {
              root = currentNode.left;
            } else {
              root = currentNode.right;
            }
          } else {
            // If the node to be deleted is a left child of its parent
            if (parentNode.left == currentNode) {
              if (currentNode.right == null) {
                parentNode.left = currentNode.left;
              } else {
                parentNode.left = currentNode.right;
              }
            } else {
              // If the node to be deleted is a right child of its parent
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

  //! INORDER TRAVERSAL
  void inOrder() {
    inOrderHelper(root);
  }

  void inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }

  //! PREORDER TRAVERSAL
  void preOrder() {
    preOrderHelper(root);
  }

  void preOrderHelper(Node? node) {
    if (node != null) {
      print(node.data);
      preOrderHelper(node.left);
      preOrderHelper(node.right);
    }
  }

  //! POSTORDER TRAVERSAL
  void postOrder() {
    postOrderHelper(root);
  }

  void postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }

  //! FIND LEAVES OF THE TREE
  void findLeaves() {
    findLeavesHelper(root);
  }

  void findLeavesHelper(Node? node) {
    if (node != null) {
      // If the node has no children, it's a leaf
      if (node.left == null && node.right == null) {
        print(node.data);
      }
      findLeavesHelper(node.left);
      findLeavesHelper(node.right);
    }
  }

  //! Check bst or not
  bool isBst() {
    List<int> values = [];

    inOrderHelperx(root, values);

    for (var i = 1; i < values.length; i++) {
      if (values[i] <= values[i - 1]) {
        return false;
      }
    }
    return true;
  }

  void inOrderHelperx(Node? node, List<int> values) {
    if (node == null) {
      return;
    }

    inOrderHelperx(node.left, values);
    values.add(node.data);
    inOrderHelperx(node.right, values);
  }
}

//! RUNNNNNNNNXXXXXXX

void main() {
  BinarySearchTree tree = BinarySearchTree();

  tree.insertNode(10);
  tree.insertNode(20);
  tree.insertNode(30);

  tree.inOrder();

  // tree.inOrder();
  // print('\n');
  // tree.preOrder();
  // print('\n');
  // tree.postOrder();

  // tree.isBst();
}
