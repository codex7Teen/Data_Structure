class Node {
  Node? left;
  Node? right;
  int data;
  Node({required this.data});
}

class BinarySearhTree {
  Node? root;
  //add
  insert(int data) {
    Node? newnode = Node(data: data);

    if (root == null) {
      root = newnode;
    } else {
      Node? curent = root;
      while (true) {
        if (data < curent!.data) {
          if (curent.left == null) {
            curent.left = newnode;
            break;
          } else {
            curent = curent.left;
          }
        } else {
          if (curent.right == null) {
            curent.right = newnode;
            break;
          } else {
            curent = curent.right;
          }
        }
      }
    }
  }

//printing
  inorder() {
    inorderhelper(root);
  }

  inorderhelper(Node? curent) {
    if (curent != null) {
      inorderhelper(curent.left);
      inorderhelper(curent.right);
      print(curent.data);
    }
  }

//delete
  delete(int target) {
    root = recursivedelete(target, root);
  }

  Node? recursivedelete(int target, Node? node) {
    if (node == null) {

      return null;
    }
    if (target > node.data) {
      node.right = recursivedelete(target, node.right);
    } else if (target < node.data) {
      node.left = recursivedelete(target, node.left);
    }

    else {
//both childeren null
      if (node.left == null && node.right == null) {
        return null;
      }
//right child null
      if (node.right == null) {
        return node.left;
      }
//left child null
      else if (node.left == null) {
        return node.right;
      }
      int? min = getminvalue(node.right);
      node.data = min!;
      node.right = recursivedelete(min, node.right);
    }
    return node;
  }

//doubt
  int? getminvalue(Node? node) {
    while (node?.left != null) {
      node = node?.right;
    }
//doubt
    return node?.data;
  }
  //checking bst or not
    isbst(){
    return isbsthelper(root,null,null);
  }
  bool isbsthelper(Node? node,Node?left,Node?right){
    if(node==null){
      return true;
    }
    if (left!=null&& left.data<=node.data || right!=null&&right.data>=node.data) {
      return false;
      
    }
    else{
      return isbsthelper(node.left, left, node)&&isbsthelper(node.right, node, right);
    }
    
  }
//to find the height of the tree
 int findheight(){
   return height(root);
  }
  int height(Node ?node){
    if (node==null) {
      return 0;
      
    }
    int leftheight=height(node.left);
    int rightheight=height(node.right);
    return 1+(leftheight>rightheight?leftheight:rightheight);
    
  }
  

}

void main() {
  BinarySearhTree binary = BinarySearhTree();
  binary.insert(2);
  binary.insert(22);
  binary.insert(23);
  binary.insert(24);
  binary.delete(23);
  binary.inorder();
}