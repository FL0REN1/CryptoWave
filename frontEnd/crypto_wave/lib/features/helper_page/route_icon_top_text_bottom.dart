import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RouteIconTopTextBottom extends StatefulWidget {
  const RouteIconTopTextBottom({
    super.key,
    required this.svgIconPath,
    required this.labelText,
    required this.width,
    required this.index,
    required this.func,
    required this.isSelected,
  });
  final String svgIconPath;
  final String labelText;
  final double width;
  final int index;
  final bool isSelected;
  final void Function() func;

  @override
  State<RouteIconTopTextBottom> createState() => _RouteIconTopTextBottomState();
}

class _RouteIconTopTextBottomState extends State<RouteIconTopTextBottom> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        widget.func();
      },
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            widget.svgIconPath,
            width: widget.width,
            colorFilter: ColorFilter.mode(
              widget.isSelected
                  ? Colors.white
                  : const Color.fromARGB(255, 199, 199, 199),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 5),
          Text(widget.labelText, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
