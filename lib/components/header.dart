import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/globals.dart';
import '../utils/my_urls.dart';
import '../widgets/theme_change_button.dart';

class Header extends StatelessWidget {
  const Header({
    required this.onHeadingClick,
    super.key,
    required this.mobileHeadingWidget,
  });

  final ValueChanged<String> onHeadingClick;
  final Widget mobileHeadingWidget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 620;
    final Map<String, Map<String, Uri>> socialLinks = {
      "LinkedIn": {"assets/svg/linkedin-svgrepo-com.svg": MyURLs.linkedIn},
      "Medium": {"assets/svg/medium-icon-svgrepo-com.svg": MyURLs.medium},
      "Stack Overflow": {
        "assets/svg/stack-overflow-svgrepo-com.svg": MyURLs.stackOverflow
      },
      "GitHub": {"assets/svg/github-svgrepo-com.svg": MyURLs.github},
    };
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isMobile
                ? Expanded(child: mobileHeadingWidget)
                : Expanded(
                    flex: 3,
                    child: ListView.builder(
                      itemBuilder: (c, i) {
                        var heading = sections.keys.elementAt(i);
                        return Padding(
                          padding: EdgeInsets.all(isMobile ? 4 : 8.0),
                          child: GestureDetector(
                            onTap: () => onHeadingClick(heading),
                            child: Container(
                              color: Colors.transparent,
                              child: Center(
                                  child: AnimatedDefaultTextStyle(
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: Text(heading))),
                            ),
                          ),
                        );
                      },
                      itemCount: sections.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
            if (!isMobile)
              Expanded(
                flex: 1,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  children: [
                    ...socialLinks.entries.map((entry) {
                      var tooltip = entry.key;
                      var assetPath = entry.value.keys.first;
                      var uri = entry.value.values.first;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrl(uri)) launchUrl(uri);
                          },
                          child: Tooltip(
                            message: tooltip,
                            child: Container(
                              color: Colors.transparent,
                              child: SvgPicture.asset(
                                assetPath,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    ThemeChangeButton(),
                  ],
                ),
              )
            else ...[
              ThemeChangeButton(),
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                  ),
                  onPressed: () => showSocialLinksMenu(context, socialLinks))
            ]
          ],
        ),
      ),
    );
  }

  void showSocialLinksMenu(
      BuildContext context, Map<String, Map<String, Uri>> socialLinks) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return Wrap(
          children: [
            ...socialLinks.entries.map((entry) {
              var tooltip = entry.key;
              var assetPath = entry.value.keys.first;
              var uri = entry.value.values.first;
              return ListTile(
                leading: SvgPicture.asset(assetPath, height: 24, width: 24),
                title: Text(
                  tooltip,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () async {
                  Navigator.pop(context);
                  if (await canLaunchUrl(uri)) launchUrl(uri);
                },
              );
            }),
          ],
        );
      },
    );
  }
}
