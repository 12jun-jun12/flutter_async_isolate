import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  // コンストラクタでサイズを初期化することが一般的です。
  Header({super.key, this.preferredSize = const Size.fromHeight(56.0)});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("async demo"),
    );
  }
}
