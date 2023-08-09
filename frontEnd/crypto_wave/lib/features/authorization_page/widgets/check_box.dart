import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({
    super.key,
    required this.labelText,
    required this.giveMeState,
    required this.onStateChanged,
    required this.uriPath,
  });

  final String uriPath;
  final String labelText;
  final bool giveMeState;
  final ValueChanged<bool> onStateChanged;

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        SizedBox(
          width: 24.0,
          height: 60,
          child: Checkbox(
            value: widget.giveMeState,
            onChanged: (value) {
              setState(() {
                widget.onStateChanged(value ?? false);
              });
            },
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () async {
            final url = Uri.parse(
              widget.uriPath,
            );
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          child: Text(
            widget.labelText,
            style: theme.textTheme.labelSmall?.copyWith(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
