import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({super.key, required this.labelText, required this.security});

  final String labelText;
  final bool security;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  TextEditingController inputController = TextEditingController();
  bool _isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();
    inputController.addListener(_oninputTextChanged);
  }

  @override
  void dispose() {
    inputController.removeListener(_oninputTextChanged);
    inputController.dispose();
    super.dispose();
  }

  void _oninputTextChanged() {
    setState(() {
      _isTextFieldEmpty = inputController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: inputController,
      obscuringCharacter: '*',
      obscureText: widget.security,
      style: theme.textTheme.labelSmall?.copyWith(
        letterSpacing: 2,
        fontSize: 13
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _isTextFieldEmpty
                ? const Color.fromARGB(255, 39, 106, 121)
                : const Color.fromARGB(255, 76, 211, 241),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _isTextFieldEmpty
                ? const Color.fromARGB(255, 39, 106, 121)
                : const Color.fromARGB(255, 76, 211, 241),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
