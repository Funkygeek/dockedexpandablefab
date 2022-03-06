import 'package:flutter/material.dart';
import './tabbar_material_widget.dart';

import 'anchored_overalay.dart';
import 'fab_with_icons.dart';


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
  String _lastSelected = 'TAB: 0';

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }
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

      floatingActionButton:   _buildFab(context),

    );
  }



Widget _buildFab(BuildContext context) {
  final icons = [ Icons.sms, Icons.mail, Icons.phone ];
  return AnchoredOverlay(
    showOverlay: true,
    overlayBuilder: (context, offset) {
      return CenterAbout(
        position: Offset(offset.dx, offset.dy - icons.length * 35.0),
        child: FabWithIcons(
          icons: icons,
          onIconTapped: _selectedFab,
        ),
      );
    },
    child: FloatingActionButton(
      onPressed: () { },
      tooltip: 'Increment',
      child: Icon(Icons.add),
      elevation: 2.0,
    ),
  );
}
}