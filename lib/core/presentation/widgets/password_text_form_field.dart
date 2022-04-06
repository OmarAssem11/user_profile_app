import 'package:final_project/core/presentation/validation/validators.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextFormField({required this.controller});
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  late bool isObscure;
  @override
  void initState() {
    isObscure = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            icon: Icon(
              isObscure
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            onPressed: () => setState(() => isObscure = !isObscure),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          errorStyle: const TextStyle(fontSize: 13),
        ),
        obscureText: isObscure,
        autocorrect: false,
        enableSuggestions: false,
        controller: widget.controller,
        validator: (value) => passwordValidator(value),
      ),
    );
  }
}
