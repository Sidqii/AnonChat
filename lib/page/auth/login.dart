import 'package:app_sempro/widget/loading_bar.dart';
import 'package:app_sempro/widget/custom_button.dart';
import 'package:app_sempro/widget/custom_panel.dart';
import 'package:app_sempro/widget/custom_snackbar.dart';
import 'package:app_sempro/widget/custom_txt_field.dart';
import 'package:app_sempro/widget/validator.dart';
import 'package:app_sempro/page/main/home.dart';
import 'package:app_sempro/module/provider/provider_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _emailFcs = FocusNode();
  final _passFcs = FocusNode();
  final _formKey = GlobalKey<FormState>();

  void _login(BuildContext context) async {
    if (_formKey.currentState?.validate() == true) {
      final provider = Provider.of<ProviderUser>(context, listen: false);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => LoadingBar(
          size: 50,
          onComplete: () async {
            await provider.login(_emailCtrl.text, _passCtrl.text);
            Navigator.pop(context);
            if (provider.isLogin) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
              CustomSnackbar.show(
                context: context,
                message: 'Login sukses',
                icon: CupertinoIcons.check_mark_circled,
              );
            } else {
              CustomSnackbar.show(
                context: context,
                message: 'Login gagal',
                icon: CupertinoIcons.xmark_circle,
              );
            }
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 55),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.chat_bubble_2_fill,
                  size: 150,
                  color: Color(0xFF1E3E62),
                ),
                Text(
                  'Anonymous Chat',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFBCCCDC),
                  ),
                ),
                SizedBox(height: 50),
                Customtxtfield(
                  controller: _emailCtrl,
                  label: 'Email',
                  validator: emailValidator,
                  keyboardType: TextInputType.emailAddress,
                  obscureTxt: false,
                  focusNode: _emailFcs,
                  focusColor: Color(0xFFBCCCDC),
                  txtColor: Color(0xFFBCCCDC),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passFcs);
                  },
                ),
                const SizedBox(height: 30),
                Customtxtfield(
                  controller: _passCtrl,
                  label: 'Password',
                  validator: passwordValidator,
                  keyboardType: TextInputType.text,
                  obscureTxt: true,
                  focusNode: _passFcs,
                  focusColor: Color(0xFFBCCCDC),
                  txtColor: Color(0xFFBCCCDC),
                  onFieldSubmitted: (_) {
                    _login(context);
                  },
                ),
                const SizedBox(height: 45),
                CustomButton(
                  onPressed: () => _login(context),
                  text: 'login',
                ),
                const SizedBox(height: 15),
                CustomPanel(
                  text: 'Lupa password?',
                  onTap: () {
                    print('Lupa password?');
                  },
                  alignment: MainAxisAlignment.end,
                ),
                const SizedBox(height: 45),
                CustomPanel(
                  onTap: () {
                    print('Belum punya akun?');
                  },
                  text: 'Belum punya akun?',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        print('Tap on Facebook');
                      },
                      icon: Image.asset(
                        'assets/logo/facebook.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(width: 30),
                    IconButton(
                      onPressed: () {
                        print('Tap on Google');
                      },
                      icon: Image.asset(
                        'assets/logo/google.png',
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
