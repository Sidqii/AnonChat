import 'package:app_sempro/widget/slider_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> avatars = [
      // 'https://www.w3schools.com/w3images/avatar2.png',
      // 'https://www.w3schools.com/w3images/avatar5.png',
      // 'https://www.w3schools.com/w3images/avatar6.png',
      // 'https://www.w3schools.com/w3images/avatar1.png',
      // 'https://www.w3schools.com/w3images/avatar2.png',
      // 'https://www.w3schools.com/w3images/avatar5.png',
      // 'https://www.w3schools.com/w3images/avatar6.png',
      // 'https://www.w3schools.com/w3images/avatar1.png',
      'assets/logo/facebook.png',
      'assets/logo/google.png',
    ];
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'menu',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                //Testing
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                //Testing
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Hamburger'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: SliderAvatar(
        items: avatars,
        onItemSelected: (index) {
          print('$index + 1');
        },
      ),
    );
  }
}
