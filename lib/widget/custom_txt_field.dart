import 'package:flutter/material.dart';

class Customtxtfield extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureTxt;
  final FocusNode focusNode;
  final void Function(String)? onFieldSubmitted;
  final Color? txtColor;
  final Color? bgColor;
  final Color? focusColor;
  final double? fontSize;

  const Customtxtfield({
    required this.controller,
    required this.label,
    required this.validator,
    required this.keyboardType,
    required this.obscureTxt,
    required this.focusNode,
    required this.onFieldSubmitted,
    this.txtColor,
    this.bgColor,
    this.focusColor,
    this.fontSize,
    super.key,
  });

  @override
  State<Customtxtfield> createState() => _CustomtxtfieldState();
}

class _CustomtxtfieldState extends State<Customtxtfield> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureTxt;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: _isObscure,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: TextStyle(
        color: widget.txtColor ?? Color(0xFF000000),
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: widget.txtColor ?? Color(0xFF000000),
          fontSize: widget.fontSize ?? 14,
        ),
        filled: true,
        fillColor: widget.bgColor ?? Colors.transparent,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.focusColor ?? Color(0xFF000000),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.focusColor ?? Color(0xFFFDFFE2),
          ),
        ),
        suffixIcon: widget.obscureTxt
            ? IconButton(
                icon: Icon(
                  _isObscure
                      ? Icons.lock_outline
                      : Icons.lock_open_outlined,
                  color: widget.focusColor ?? Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
      ),
    );
  }
}
