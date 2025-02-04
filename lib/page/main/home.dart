import 'package:app_sempro/page/main/drawer.dart';
import 'package:app_sempro/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBCCCDC),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFBCCCDC)),
        backgroundColor: Color(0xFF1E3E62),
        title: Icon(
          CupertinoIcons.chat_bubble_2_fill,
          color: Color(0xFFBCCCDC),
        ),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.eyeglasses,
              size: 150,
            ),
            const SizedBox(height: 40),
            Text(
              'Selamat datang di Anonymous Chat Bot!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Mulai obrolan dengan siapaun dan kapanpun secara anonim.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            CustomButton(
              onPressed: () {
                print('Mulai chat');
              },
              text: 'Mulai chat',
            ),
          ],
        ),
      ),
    );
  }
}
