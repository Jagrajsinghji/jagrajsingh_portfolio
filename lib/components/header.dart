import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/my_theme.dart';
import '../utils/my_urls.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        MyTheme.greenBushWithOpacity.withOpacity(.2),
        MyTheme.whatStandButton.withOpacity(.5),
        MyTheme.smoke
      ], stops: const [
        .2,
        .4,
        .9
      ])),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Center(child: Image.asset("assets/JS_logo.png")),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                reverse: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (await canLaunchUrl(MyURLs.linkedIn)) {
                          launchUrl(MyURLs.linkedIn);
                        }
                      },
                      child: Tooltip(
                        message: "LinkedIn",
                        child: Container(
                          color: Colors.transparent,
                          child: SvgPicture.asset(
                            "assets/svg/linkedin-svgrepo-com.svg",
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (await canLaunchUrl(MyURLs.medium)) {
                          launchUrl(MyURLs.medium);
                        }
                      },
                      child: Tooltip(
                        message: "Medium",
                        child: Container(
                          color: Colors.transparent,
                          child: SvgPicture.asset(
                            "assets/svg/medium-icon-svgrepo-com.svg",
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (await canLaunchUrl(MyURLs.stackOverflow)) {
                          launchUrl(MyURLs.stackOverflow);
                        }
                      },
                      child: Tooltip(
                        message: "Stack Overflow",
                        child: Container(
                          color: Colors.transparent,
                          child: SvgPicture.asset(
                            "assets/svg/stack-overflow-svgrepo-com.svg",
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (await canLaunchUrl(MyURLs.github)) {
                          launchUrl(MyURLs.github);
                        }
                      },
                      child: Tooltip(
                        message: "GitHub",
                        child: Container(
                          color: Colors.transparent,
                          child: SvgPicture.asset(
                            "assets/svg/github-svgrepo-com.svg",
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
