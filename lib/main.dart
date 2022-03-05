import 'package:flutter/material.dart';
import './tabbar_material_widget.dart';
import './expandable_fab.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expandable FAB Docked Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Expandable FAB Docked Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey,
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Expandable Docked FAB Example',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const TabBarMaterialWidget(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () => _showAction(context, "0","0"),
            icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () => _showAction(context, "1","1"),
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () => _showAction(context, "2","2"),
            icon: const Icon(Icons.videocam),
          ),
        ],
      ),
    );
  }

  void _showAction(BuildContext context, String title, String content) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }
}
