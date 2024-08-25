class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BinarySearchTree {

  Node? root;

//! insert node
  void insertNode(int data) {
    Node? currentNode = root;
    Node newNode = Node(data);

    if(currentNode == null) {
      root = newNode;
      return;
    }

    while(true) {
      if(newNode.data < currentNode!.data) {
        if(currentNode.left == null) {
          currentNode.left = newNode;
          break;
        } else {
          currentNode = currentNode.left;
        }
      } else {
        if(currentNode.right == null) {
          currentNode.right = newNode;
          break;
        } else {
          currentNode = currentNode.right;
        }
      }
    }
  }

  
//! check contains
bool contains(int data) {
  Node? currentNode = root;

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

void deleteNode(int data) {
  deleteHelper(data, root, null);
}

void deleteHelper(int data, Node? currentNode, Node? parentNode) {

  while(currentNode != null) {
    if(data < currentNode.data) {
      parentNode = currentNode;
      currentNode = currentNode.left;
    } else if (data > currentNode.data) {
      parentNode = currentNode;
      currentNode = currentNode.right;
    } else {
      if(currentNode.left != null && currentNode.right != null) {
        currentNode.data = getMinValueHelper(currentNode.right);
        deleteHelper(currentNode.data, currentNode.right, currentNode);
      } else {
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

int getMinValueHelper(Node? currentNode) {
  if(currentNode!.left == null) {
    return currentNode.data;
  } else {
    return getMinValueHelper(currentNode.left);
  }
}

//! inorder

void inorder() {
  inOrderHelper(root);
}

void inOrderHelper(Node? node) {
  if(node != null) {
  inOrderHelper(node.left);
  print(node.data);
  inOrderHelper(node.right);
  }
}

void preOrder() {
  preOrderHelper(root);
}

void preOrderHelper(Node? node) {
  if(node != null) {
    print(node.data);
    preOrderHelper(node.left);
    preOrderHelper(node.right);
  }
}

  void postOrder() {
    postOrderHelper(root);
  }

  void postOrderHelper(Node? node) {
    if(node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }
}


void main() {
  BinarySearchTree tree = BinarySearchTree();

  tree.insertNode(10);
  tree.insertNode(30);
  tree.insertNode(5);

  
  
}