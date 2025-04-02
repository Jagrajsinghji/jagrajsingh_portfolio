import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/my_urls.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 620;
    var children = [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () async {
                    if (await canLaunchUrl(MyURLs.phone)) {
                      launchUrl(MyURLs.phone);
                    }
                  },
                  child: Tooltip(
                    message: "+1(647)895-7854",
                    child: Container(
                      color: Colors.transparent,
                      child: SvgPicture.asset("assets/svg/phone.svg",
                          width: 30,
                          height: 30,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () async {
                    if (await canLaunchUrl(MyURLs.email)) {
                      launchUrl(MyURLs.email);
                    }
                  },
                  child: Tooltip(
                    message: "jagrajsingh0624@gmail.com",
                    child: Container(
                      color: Colors.transparent,
                      child: SvgPicture.asset("assets/svg/email.svg",
                          height: 25,
                          width: 25,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                      child: SvgPicture.asset("assets/svg/twitter.svg",
                          width: 30,
                          height: 30,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                      child: SvgPicture.asset("assets/svg/insta.svg",
                          width: 30,
                          height: 30,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: isMobile?0:10.0,bottom: isMobile?10:0),
        child: Text(
          "Copyright © ${DateTime.now().year} Jagraj Singh ",
          maxLines: 2,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    ];
    return Container(
        height: 70,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            color: Colors.transparent, border: Border(top: BorderSide())),
        child: isMobile
            ? Column(
                children: children,
              )
            : Row(
                children: children,
              ));
  }
}
