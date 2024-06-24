import 'package:flutter/material.dart';
import 'package:flutter_async_isolate/header.dart';
import 'package:flutter_async_isolate/second_page.dart';
import 'package:flutter_async_isolate/third_page.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              fetchHogeHoge();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: const Text("async function Start"),
          ),
          const Gap(20),
          ElevatedButton(
            onPressed: () {
              fetchHogeHoge();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ThirdPage()));
            },
            child: const Text("async vs Isolate Start"),
          ),
        ],
      )),
    );
  }
}

Future<void> fetchHogeHoge() async {
  return await Future.delayed(Duration(seconds: 5),() => print("前ページで非同期処理HogeHogeです。"));
}
