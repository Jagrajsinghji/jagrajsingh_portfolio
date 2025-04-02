import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SkillIcon extends StatefulWidget {
  final String skillName;
  final String iconUrl;

  const SkillIcon({super.key, required this.skillName, required this.iconUrl});

  @override
  State<SkillIcon> createState() => _SkillIconState();
}

class _SkillIconState extends State<SkillIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Tooltip(
          message: widget.skillName,
          enableFeedback: true,
          enableTapToDismiss: false,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: Colors.blueAccent,
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
            ),
            transform: isHovered
                ? (Matrix4.identity()..scale(1.1))
                : Matrix4.identity(),
            child: SvgPicture.network(
              widget.iconUrl,
              width: 40,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
