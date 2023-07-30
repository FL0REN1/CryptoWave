import 'package:flutter/material.dart';

class RoutedTextTabs extends StatefulWidget {
  const RoutedTextTabs({
    super.key,
    required this.firstTabName,
    required this.secondTabName,
    required this.firstTabFunc,
    required this.secondTabFunc,
    required this.width,
    required this.isFirstTabSelect,
  });

  final String firstTabName;
  final String secondTabName;

  final void Function() firstTabFunc;
  final void Function() secondTabFunc;

  final double width;

  final bool isFirstTabSelect;

  @override
  State<RoutedTextTabs> createState() => _RoutedTextTabsState();
}

class _RoutedTextTabsState extends State<RoutedTextTabs> {
  late String _selectedTab;

  @override
  void initState() {
    super.initState();
    widget.isFirstTabSelect ? _selectedTab = widget.firstTabName : _selectedTab = widget.secondTabName;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            widget.firstTabFunc();
            setState(() {
              _selectedTab = widget.firstTabName;
            });
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.only(bottom: 5),
            duration: const Duration(milliseconds: 300),
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
            child: AnimatedDefaultTextStyle(
              style: _selectedTab == widget.firstTabName
                  ? theme.textTheme.labelMedium!.copyWith(
                      color: Colors.blue,
                    )
                  : theme.textTheme.labelMedium!,
              duration: const Duration(milliseconds: 300),
              child: Text(
                widget.firstTabName,
              ),
            ),
          ),
        ),
        SizedBox(width: widget.width),
        GestureDetector(
          onTap: () {
            widget.secondTabFunc();
            setState(() {
              _selectedTab = widget.secondTabName;
            });
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.only(bottom: 5),
            duration: const Duration(milliseconds: 300),
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
            child: AnimatedDefaultTextStyle(
              style: _selectedTab == widget.secondTabName
                  ? theme.textTheme.labelMedium!.copyWith(
                      color: Colors.blue,
                    )
                  : theme.textTheme.labelMedium!,
              duration: const Duration(milliseconds: 300),
              child: Text(
                widget.secondTabName,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
