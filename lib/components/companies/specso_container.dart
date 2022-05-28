import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/my_theme.dart';
import '../../utils/my_urls.dart';

class SpecsoContainer extends StatefulWidget {
  const SpecsoContainer({Key? key}) : super(key: key);

  @override
  State<SpecsoContainer> createState() => _SpecsoContainerState();
}

class _SpecsoContainerState extends State<SpecsoContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _titleTranslation;
  late Animation<double> _contentOpacity;

  bool isTapped = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _titleTranslation = Tween(begin: Alignment.center, end: Alignment.topCenter)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _contentOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            isTapped = !isTapped;
            if (isTapped) if (mounted) _controller.forward();
            if (!isTapped) if (mounted) _controller.reverse();
          },
          child: MouseRegion(
            onEnter: (d) {
              if (mounted) _controller.forward();
            },
            onExit: (d) {
              if (mounted) _controller.reverse();
            },
            child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: MyTheme.greenBushWithOpacity,
                          blurRadius: 3,
                          spreadRadius: 2,
                          offset: const Offset(2, 2))
                    ],
                    color: MyTheme.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(14),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        transform: Transform.translate(
                                offset: Offset(
                                    0, -50 + (50 * _contentOpacity.value)))
                            .transform,
                        child: AnimatedOpacity(
                          opacity: _contentOpacity.value,
                          duration: const Duration(milliseconds: 300),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Specso Technologies",
                                  style: TextStyle(
                                      color: Colors.red.shade800,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "In July 2020, I began working as a summer intern at Specso Technologies.",
                                    style: TextStyle(
                                      color: MyTheme.text,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "While working on several design-heavy projects, I honed my UI/UX talents.",
                                    style: TextStyle(
                                      color: MyTheme.text,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "Flutter has helped me construct anything from E-Commerce applications to Service-based applications.",
                                    style: TextStyle(
                                      color: MyTheme.text,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      alignment: _titleTranslation.value,
                      child: Image.asset(
                        "assets/specso_logo.png",
                        height: 120 - (60 * _controller.value),
                        width: 120 - (60 * _controller.value),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.open_in_new),
                        onPressed: () async {
                          if (await canLaunchUrl(MyURLs.specsoLinkedIn)) {
                            launchUrl(MyURLs.specsoLinkedIn);
                          }
                        },
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
