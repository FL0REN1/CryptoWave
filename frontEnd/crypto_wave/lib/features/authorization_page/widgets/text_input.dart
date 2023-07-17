import 'package:crypto_wave/features/helper_page/helper_page.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    required this.labelText,
    required this.security,
    required this.giveMeText,
    required this.onTextSubmitted,
    required this.errorCondition,
    required this.errorText,
  }) : super(key: key);

  final String labelText;
  final bool security;
  final TextEditingController giveMeText;
  final Function(String) onTextSubmitted;
  final bool Function(String)? errorCondition;
  final String? errorText;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isTextFieldEmpty = true;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isTextFieldEmpty = widget.giveMeText.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: widget.giveMeText,
      focusNode: _focusNode,
      obscuringCharacter: '*',
      obscureText: widget.security,
      onChanged: (newValue) {
        setState(() {
          _isTextFieldEmpty = newValue.isEmpty;
        });
      },
      onSubmitted: (newValue) {
        setState(() {
          _isTextFieldEmpty = newValue.isEmpty;
        });
        if (widget.errorCondition != null &&
            !widget.errorCondition!(newValue)) {
          widget.giveMeText.clear();
          setState(() {});
          showErrorSnackBar(
            context,
            widget.errorText ?? 'Invalid input',
          );
        } else {
          widget.onTextSubmitted(newValue);
        }
      },
      style:
          theme.textTheme.labelSmall?.copyWith(letterSpacing: 2, fontSize: 13),
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
