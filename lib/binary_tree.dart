import 'package:flutter/material.dart';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val);
}

class BinaryTree {
  TreeNode? root;

  // 插入节点
  void insert(int value) {
    if (root == null) {
      root = TreeNode(value);
    } else {
      _insert(root!, value);
    }
  }

  void _insert(TreeNode node, int value) {
    if (value < node.val) {
      if (node.left == null) {
        node.left = TreeNode(value);
      } else {
        _insert(node.left!, value);
      }
    } else {
      if (node.right == null) {
        node.right = TreeNode(value);
      } else {
        _insert(node.right!, value);
      }
    }
  }

  // 前序遍历
  void preOrderTraversal(TreeNode? node) {
    if (node != null) {
      print(node.val);
      preOrderTraversal(node.left);
      preOrderTraversal(node.right);
    }
  }
}

class BinaryTreeDisplay extends StatefulWidget {
  const BinaryTreeDisplay({super.key});

  @override
  State<BinaryTreeDisplay> createState() => _BinaryTreeDisplayState();
}

class _BinaryTreeDisplayState extends State<BinaryTreeDisplay> {
  TreeNode? root;

  @override
  void initState() {
    super.initState();
    // 构建一个简单的二叉树示例
    root = TreeNode(1);
    root?.left = TreeNode(2);
    root?.right = TreeNode(3);
    root?.left?.left = TreeNode(4);
    root?.left?.right = TreeNode(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildTree(root),
      ),
    );
  }

  Widget _buildTree(TreeNode? node) {
    if (node == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        Text('Value: ${node.val}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTree(node.left),
            const SizedBox(width: 20),
            _buildTree(node.right),
          ],
        ),
      ],
    );
  }
}
