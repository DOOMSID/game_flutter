import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: MyHomePage (),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        color: Colors.yellow[100],
        child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 2.0),
          itemBuilder: (context, index) {
            String myKey;
            String content;
            double tileHeight = 90.0;

            if (index == 0) {
              myKey = 'animal';
              content = 'cute animals';
            } else if (index == 1) {
              myKey = 'food';
              content = 'tasty food';
            } else {
              myKey = 'travel';
              content = 'travel with the game';
            }

            return SizedBox(
              height: tileHeight,
              child: InkWell(
                key: Key('item_$index'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(initialMyKey: myKey, initialContent: content),
                    ),
                  );
                },
                child: ListTile(
                  leading: SizedBox(
                    height: 80.0, //
                    child: Image.asset(
                      'assets/images/$myKey.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    myKey.capitalizeFirstLetter(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    content,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GridViewScreen(),
                ),
              );
            },
            label: const Text('Switch'),
            icon: const Icon(Icons.swap_horizontal_circle),
            backgroundColor: Colors.purple,
          ),
        ),
      ),
    );
  }
}



class SecondScreen extends StatefulWidget {
  final String initialMyKey;
  final String initialContent;

  const SecondScreen({super.key, required this.initialMyKey, required this.initialContent});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late String myKey;
  late String content;

  @override
  void initState() {
    super.initState();
    myKey = widget.initialMyKey;
    content = widget.initialContent;
  }

  void updateData() {
    final List<String> myKeys = ['animal', 'food', 'travel'];
    final List<String> contents = ['cute animals', 'tasty food', 'travel with the game'];

    final randomIndex = Random().nextInt(myKeys.length);

    setState(() {
      myKey = myKeys[randomIndex];
      content = contents[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffc84f),
      appBar: AppBar(
        backgroundColor: const Color(0xFFffc84f),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          updateData();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 500,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      'assets/images/$myKey.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 10,
                      child: Text(
                        content,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

AppBar buildAppBar() {
  return AppBar(
    title: const Text(
      'N o n o g r a m s',
      style: TextStyle(
        color: Colors.purple,//Color(0xFF5D0A95),
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Color(0xFF303030),
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
          ),
        ],
      ),
    ),
    centerTitle: true,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellow, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
  );
}

class GridViewScreen extends StatelessWidget {

  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        color: Colors.yellow[100],
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            String myKey;
            String content;
            Color color;

            if (index == 0) {
              myKey = 'animal';
              content = 'cute animals';
              color = const Color(0xFF7ECCEF);
            } else if (index == 1) {
              myKey = 'food';
              content = 'tasty food';
              color = const Color(0xFFFA8191);
            } else {
              myKey = 'travel';
              content = 'travel with the game';
              color = const Color(0xFF7ECCEF);
            }
            return MyButton(index: '$index', myKey: myKey, content: content, color: color);
          },
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
            label: const Text('Switch'),
            icon: const Icon(Icons.swap_horizontal_circle),
            backgroundColor: Colors.purple,
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String content;
  final String myKey;
  final String index;
  final Color color;

  const MyButton(
      {super.key, required this.index, required this.myKey, required this.content, required this.color});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: Key('item_$index'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SecondScreen(initialMyKey: myKey, initialContent: content),
          ),
        );
      },
      child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
            //border: Border.all(color: Colors.black, width: 2.0),
          ),
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/$myKey.png',
                width: 80.0,
                height: 110.0,
              ),
              ListTile(
                title: Text(
                  myKey.capitalizeFirstLetter(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          )
      ),
    );
  }
}



extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

