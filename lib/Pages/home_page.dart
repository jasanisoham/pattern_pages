import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today, May 13 "),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "TODO (3)",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Fiz Parring",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.teal[800],
        iconSize: 30,
      ),
    );
  }
}
