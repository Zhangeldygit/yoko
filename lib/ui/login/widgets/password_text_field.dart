import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {Key? key, required this.passwordController, this.onChanged})
      : super(key: key);
  final TextEditingController passwordController;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.white,
      ),
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Пароль',
        suffixIcon: const Icon(
          Icons.remove_red_eye,
          color: Colors.white,
        ),
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        counterText: '',
      ),
      // maxLength: 8,
      // onSaved: onSaved,
    );
  }
}
