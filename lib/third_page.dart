import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_async_isolate/header.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool isolateDone = false;
  bool asyncDone = false;

  late ReceivePort receivePort;
  @override
  void initState() {
    super.initState();
    ReceivePort receivePort = ReceivePort();

    Isolate.spawn(isolateFunction, receivePort.sendPort);
    Future(() async {
      print("ISOLATE処理です。");
      int result = await receivePort.first;
      print('ISOLATE計算結果: $result');
      setState(() {
        isolateDone = true;
      });
    });

    // Future(() async {
    //   print("非同期処理です。");
    //   int number = await asyncFunction();
    //   print('非同期計算結果:$number');
    //   setState(() => asyncDone = true);
    // });

    Future(() {
      print("プリントだけする関数を実行します");
      asyncPrintFunction();
    });
  }

  @override
  void dispose() {
    receivePort.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build処理です。");
    return Scaffold(
      appBar: Header(),
      body: Center(
          child: asyncDone && isolateDone
              ? const Text("両処理完了しました")
              : const CircularProgressIndicator(color: Colors.purple)),
    );
  }
}

void isolateFunction(SendPort sendPort) {
  int result = 0;
  for (int i = 0; i < 20000000000; i++) {
    result += i;
  }
  sendPort.send(result);
}

Future<int> asyncFunction() async {
  int number = 0;
  for (int i = 0; i < 20000000000; i++) {
    number += i;
  }
  return number;
}

Future<void>? asyncPrintFunction() {
  int number = 0;
  for (int i = 0; i < 20000000000; i++) {
    number += i;
  }
  print(number);
}
