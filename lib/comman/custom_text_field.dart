import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.hinttext,
    this.onchange,
    this.prefixIcon,
    this.suffixIconFirst,
    this.suffixIconSecond,
    required this.textType,
    this.onFieldSubmitted,
    this.onSaved,
  });
  String? hinttext;
  IconData? prefixIcon;
  IconData? suffixIconFirst;
  IconData? suffixIconSecond;
  TextInputType? textType;
  ValueChanged<String>? onFieldSubmitted;
  FormFieldSetter<String>? onSaved;
  Function(String)? onchange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.textType,
      validator: (value) {
        if (value == null)
          return 'required';
      },
      onChanged: widget.onchange,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon),
        hintText: widget.hinttext,
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
