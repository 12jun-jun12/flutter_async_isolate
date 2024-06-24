import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_async_isolate/header.dart';

class SecondPage extends StatefulWidget {
  SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String data = '';
  @override
  void initState() {
    super.initState();
    print("initState start");
    Future(() => print("initState で2番目に記載されている処理です。"));
    fetchName(); //非同期処理
    fetchAge(); //同期処理
    Future(() async {
      fetchJob();
      final something = await fetchSomething();
      setState(() {
        data = something;
      });
    });
    print("initState done");
  }

  @override
  Widget build(BuildContext context) {
    print("build method start");
    return Scaffold(
      appBar: Header(),
      body: Center(
          child: data.isEmpty ? const CircularProgressIndicator() : Text(data)),
    );
  }
}

Future<void> fetchName() {
  print("fetchName start");
  return Future.delayed(const Duration(seconds: 5), () => print("私の名前はJunです。"));
}

void fetchAge() {
  print("fetchAge start");
  return print("26歳です。");
}

Future<void> fetchJob() {
  print("fetchJob start");
  return Future.delayed(const Duration(seconds: 5), () => print("私はエンジニアです。"));
}

Future<String> fetchSomething() async {
  print("fetchSomething start");
  return await Future.delayed(const Duration(seconds: 5), () => "Something");
}
