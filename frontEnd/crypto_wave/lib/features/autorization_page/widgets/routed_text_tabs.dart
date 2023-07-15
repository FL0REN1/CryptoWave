import 'package:flutter/material.dart';

class RoutedTextTabs extends StatefulWidget {
  const RoutedTextTabs({
    super.key,
    required this.firstTabName,
    required this.secondTabName,
  });

  final String firstTabName;
  final String secondTabName;

  @override
  State<RoutedTextTabs> createState() => _RoutedTextTabsState();
}

class _RoutedTextTabsState extends State<RoutedTextTabs> {
  late String _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.secondTabName;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedTab = widget.firstTabName;
            });
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              border: _selectedTab == widget.firstTabName
                  ? const Border(
                      bottom: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    )
                  : null,
            ),
            child: Text(
              widget.firstTabName,
              style: _selectedTab == widget.firstTabName
                  ? theme.textTheme.labelMedium?.copyWith(
                      color: Colors.blue,
                    )
                  : theme.textTheme.labelMedium,
            ),
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedTab = widget.secondTabName;
            });
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              border: _selectedTab == widget.secondTabName
                  ? const Border(
                      bottom: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    )
                  : null,
            ),
            child: Text(
              widget.secondTabName,
              style: _selectedTab == widget.secondTabName
                  ? theme.textTheme.labelMedium?.copyWith(
                      color: Colors.blue,
                    )
                  : theme.textTheme.labelMedium,
            ),
          ),
        ),
      ],
    );
  }
}
