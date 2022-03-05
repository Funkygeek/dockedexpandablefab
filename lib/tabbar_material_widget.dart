import 'package:flutter/material.dart';

class TabBarMaterialWidget extends StatefulWidget {
  const TabBarMaterialWidget({Key? key}) : super(key: key);

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  final placeholder = const Opacity(
      opacity: 0,
      child: IconButton(
        onPressed: null,
        icon: Icon(Icons.no_cell),
      ));

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(1,  const Icon(Icons.abc)),
            placeholder,
            buildTabItem(0, const Icon(Icons.alarm)),
          ],
        ));
  }

  Widget buildTabItem(int index, Icon icon) {
    return IconButton(icon: icon, onPressed: () {
      if(index == 1) {
        _showAction(context, "1st Item", "1st Item Pressed");
      } else
      {
        _showAction(context, "2nd Item", "2nd Item Pressed");
      }

    });
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