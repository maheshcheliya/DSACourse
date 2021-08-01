import UIKit

var str = "Binary Tree Traversal"

public class Node {
    var data : Int?
    var left : Node?
    var right : Node?
    
    init(_ value: Int) {
        self.data = value
    }
}

func preOrderTraversal(node : Node?) {
    
    if (node == nil) {
        return
    }
    
    // first print data of node
    print(node?.data)
    
    // then recur on left subtree
    preOrderTraversal(node: node?.left)
    
    // then recur on right subtree
    preOrderTraversal(node: node?.right)
}

func inOrderTraversal(node : Node?) {
    
    if (node == nil) {
        return
    }
    
    // first recur on left subtree
    inOrderTraversal(node: node?.left)
    
    // then print data of node
    print(node?.data)
    
    // then recur on right subtree
    inOrderTraversal(node: node?.right)
}

func postOrderTraversal(node: Node?)  {
    if (node == nil) {
        return
    }
    
    // first recur on left subtree
    postOrderTraversal(node: node?.left)

    // then recur on right subtree
    postOrderTraversal(node: node?.right)
    
    // then print data of node
    print(node?.data)
}

func heightOfTree(root: Node?) -> Int {
    if(root == nil) {
        return -1
    }
    let h1 = heightOfTree(root: root?.left)
    let h2 = heightOfTree(root: root?.right)
    
    return h1 > h2 ? h1 + 1 : h2 + 1
}

let node = Node(1)
node.left = Node(2)
node.right = Node(3)

node.left?.left = Node(4)
node.left?.right = Node(5)

node.left?.left?.left = Node(6)
node.left?.left?.right = Node(7)

node.left?.right?.left = Node(8)
node.left?.right?.right = Node(9)

let height = heightOfTree(root: node)
print(height)


print("====")
preOrderTraversal(node: node)
print("====")
inOrderTraversal(node: node)
print("====")
postOrderTraversal(node: node)
