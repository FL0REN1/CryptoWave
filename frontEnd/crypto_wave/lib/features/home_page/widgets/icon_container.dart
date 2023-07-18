import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatefulWidget {
  const IconContainer(
      {super.key,
      required this.svgIconPath,
      required this.flutterIcon,
      required this.padding,
      required this.blueStyle,
      required this.redStyle,
      required this.greenStyle});
  final String? svgIconPath;
  final IconData? flutterIcon;
  final double padding;
  final bool blueStyle;
  final bool redStyle;
  final bool greenStyle;

  @override
  State<IconContainer> createState() => _IconContainerState();
}

class _IconContainerState extends State<IconContainer> {
  late List<Color> colors;

  @override
  void initState() {
    if (widget.blueStyle) colors = [Colors.blueGrey, Colors.blue];
    if (widget.redStyle) {
      colors = [const Color.fromARGB(120, 158, 158, 158), Colors.red];
    }
    if (widget.greenStyle) {
      colors = [const Color.fromARGB(120, 158, 158, 158), Colors.greenAccent];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.4, 1.0],
            colors: colors),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.padding),
        child: widget.svgIconPath != null
            ? SvgPicture.asset(widget.svgIconPath!)
            : Icon(widget.flutterIcon),
      ),
    );
  }
}
