import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) =>
        [
          PopupMenuItem(
            child: Row(
              children: [
                Text("Favorites"),
              ],
            ),
          ),
          PopupMenuItem(
              child: Row(
                children: [
                  Text("Share"),
                ],
              ))
        ]);
  }
}