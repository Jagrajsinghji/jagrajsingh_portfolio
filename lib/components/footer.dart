import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jagrajsingh_portfolio/utils/my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/my_urls.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 620;
    var children = [
      Expanded(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () async {
                  if (await canLaunchUrl(MyURLs.phone)) {
                    launchUrl(MyURLs.phone);
                  }
                },
                child: Tooltip(
                  message: "+919582218674",
                  child: Container(
                    color: Colors.transparent,
                    child: SvgPicture.asset(
                      "assets/svg/phone.svg",
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
                  if (await canLaunchUrl(MyURLs.email)) {
                    launchUrl(MyURLs.email);
                  }
                },
                child: Tooltip(
                  message: "jagrajsinghji99@gmail.com",
                  child: Container(
                    color: Colors.transparent,
                    child: SvgPicture.asset(
                      "assets/svg/email.svg",
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () async {
                  if (await canLaunchUrl(MyURLs.twitter)) {
                    launchUrl(MyURLs.twitter);
                  }
                },
                child: Tooltip(
                  message: "Twitter",
                  child: Container(
                    color: Colors.transparent,
                    child: SvgPicture.asset(
                      "assets/svg/twitter.svg",
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
                  if (await canLaunchUrl(MyURLs.instagram)) {
                    launchUrl(MyURLs.instagram);
                  }
                },
                child: Tooltip(
                  message: "Instagram",
                  child: Container(
                    color: Colors.transparent,
                    child: SvgPicture.asset(
                      "assets/svg/insta.svg",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const Text(
        "Copyright © 2022 Jagraj Singh.",
        maxLines: 2,
        style: TextStyle(fontSize: 14, color: MyTheme.nameText),
      ),
    ];
    return Container(
        height: 70,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(top: BorderSide(color: MyTheme.nameText))),
        child: isMobile
            ? Column(
                children: children,
              )
            : Row(
                children: children,
              ));
  }
}
