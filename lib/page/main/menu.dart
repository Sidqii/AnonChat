import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.blueGrey,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.blueGrey,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.blueGrey,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
