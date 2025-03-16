// binary search tree (bst)

class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class Bst {
  Node? root;

  // add
  void add(int data) {
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

  // check contains
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

  // inorder traversal
  void inorder() {
    return inorderHelper(root);
  }

  void inorderHelper(Node? node) {
    if (node != null) {
      inorderHelper(node.left);
      print(node.data);
      inorderHelper(node.right);
    }
  }

  void preorder() {
    return preorderHelper(root);
  }

  void preorderHelper(Node? node) {
    if (node != null) {
      print(node.data);
      preorderHelper(node.left);
      preorderHelper(node.right);
    }
  }

  void postOrder() {
    return postOrderHelper(root);
  }

  void postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }

  // find leaves in a tree
  void findLeaves() {
    return findLeavesHelper(root);
  }

  void findLeavesHelper(Node? node) {
    if (node != null) {
      if (node.left == null && node.right == null) {
        print(node.data);
      }
      findLeavesHelper(node.left);
      findLeavesHelper(node.right);
    }
  }

  // delete a node from bst
  void deleteNode(int data) {
    return deleteNodeHelper(data, root, null);
  }

  void deleteNodeHelper(int data, Node? currentNode, Node? parentNode) {
    while (currentNode != null) {
      if (data < currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        // found
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = findSmallest(currentNode);
          deleteNodeHelper(currentNode.data, currentNode.right, currentNode);
        } else {
          // when root is the one to be deleted
          if(parentNode == null) {
            if(currentNode.right == null) {
              root = currentNode.left;
            } else {
              root = currentNode.right;
            }
          } else {
            if(parentNode.left == currentNode) {
              if(currentNode.right == null) {
                parentNode.left = currentNode.left;
              } else {
                parentNode.left = currentNode.right;
              }
            } else {
              if(currentNode.right == null) {
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

  int findSmallest(Node? currentNode) {
    if (currentNode?.left == null) {
      return currentNode!.data;
    } else {
      return findSmallest(currentNode?.left);
    }
  }
}

void main() {
  Bst bst = Bst();

  bst.add(10);
  bst.add(5);
  bst.add(30);

  bst.deleteNode(5);

  print(bst.checkContains(5));
}
