import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jagrajsingh_portfolio/models/company.dart';
import 'package:jagrajsingh_portfolio/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyContainer extends StatefulWidget {
  const CompanyContainer(this.company, {super.key});

  final Company company;

  @override
  State<CompanyContainer> createState() => _CompanyContainerState();
}

class _CompanyContainerState extends State<CompanyContainer>
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
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: context.read<ThemeProvider>().containersColor),
                padding: const EdgeInsets.all(14),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        transform:
                            Transform.translate(offset: Offset(0, 0)).transform,
                        child: AnimatedOpacity(
                          opacity: _contentOpacity.value,
                          duration: const Duration(milliseconds: 300),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.company.name,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                ...widget.company.experiences
                                    .map((exp) => Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            exp,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(fontSize: 10),
                                          ),
                                        )),
                              ]),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: 1 - _contentOpacity.value,
                      duration: const Duration(milliseconds: 300),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        alignment: _titleTranslation.value,
                        child: SvgPicture.asset(
                          widget.company.assetImage,
                          height: 90 - (55 * _controller.value),
                          width: 90 - (55 * _controller.value),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.open_in_new),
                        onPressed: () async {
                          if (await canLaunchUrl(widget.company.link)) {
                            launchUrl(widget.company.link);
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
