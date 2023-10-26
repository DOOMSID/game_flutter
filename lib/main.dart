import 'package:flutter/material.dart';

class MyBody extends StatelessWidget{
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Column(
        children: [
          Text('Hello World!'),
        ]
    ),
    );
  }
}
void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(title: const Text('My First Project')),
              body: const MyBody()
          )
      )
  );
}