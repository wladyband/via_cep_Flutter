import 'package:cep/core/color/AppColor.dart';
import 'package:cep/core/color/hex_color.dart';
import 'package:flutter/material.dart';

class AppField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final bool obscured;
  final EdgeInsets pad;
  final void Function(String)? onChanged;
  final String? Function(String?)? validation;

  const AppField(
      {Key? key,
      this.label,
      this.onChanged,
      EdgeInsets? padding,
      this.controller,
      this.obscured = false,
      this.validation})
      : pad = padding ?? const EdgeInsets.all(10),
        super(key: key);

  @override
  State<AppField> createState() => _AppFieldState();
}

class _AppFieldState extends State<AppField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.pad,
      child: TextFormField(
        onChanged: widget.onChanged,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validation,
        controller: widget.controller,
        obscureText: widget.obscured,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.black54,
          ),
          hintStyle: const TextStyle(fontSize: 13),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: Colors.indigoAccent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            borderSide: BorderSide(color: Colors.black26),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close, size: 6),
            onPressed: () => widget.controller?.clear(),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
