import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF1E3E62),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Text(
                'A',
                style: TextStyle(fontSize: 24),
              ),
            ),
            accountName: Text(
              'User name',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFBCCCDC),
              ),
            ),
            accountEmail: Text(
              'Email name',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFBCCCDC),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xFFBCCCDC),
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: Color(0xFFBCCCDC)),
            ),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              color: Color(0xFFBCCCDC),
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: Color(0xFFBCCCDC)),
            ),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
