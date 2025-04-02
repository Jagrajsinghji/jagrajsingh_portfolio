import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/sections/skills/skill_icon.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isVisible = false;

  final Map<String, List<Map<String, String>>> skillIcons = {
    "Mobile Development": [
      {
        "name": "Java",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg"
      },
      {
        "name": "Android",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/android/android-original.svg"
      },
      {
        "name": "Swift",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/swift/swift-original.svg"
      },
      {
        "name": "Kotlin",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kotlin/kotlin-original.svg"
      },
      {
        "name": "Dart",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg"
      },
      {
        "name": "XCode",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/xcode/xcode-original.svg"
      },
    ],
    "Frontend Development": [
      {
        "name": "HTML",
        "url":
            "https://cdn.jsdelivr.net/npm/devicon/icons/html5/html5-original.svg"
      },
      {
        "name": "CSS",
        "url":
            "https://cdn.jsdelivr.net/npm/devicon/icons/css3/css3-original.svg"
      },
      {
        "name": "JavaScript",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg"
      },
      {
        "name": "Flutter",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg"
      },
      {
        "name": "Vue.JS",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vuejs/vuejs-original-wordmark.svg"
      },
    ],
    "Backend Development": [
      {
        "name": "C#",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/csharp/csharp-original.svg"
      },
      {
        "name": "Spring Boot",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/spring/spring-original.svg"
      },
      {
        "name": "Node.js",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg"
      },
      {
        "name": "Python",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg"
      },
      {
        "name": ".NET Core",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/dotnetcore/dotnetcore-original.svg"
      },
      {
        "name": "Nest Js",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/nestjs/nestjs-original-wordmark.svg"
      },
    ],
    "Cloud Technologies": [
      {
        "name": "Google Cloud",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/googlecloud/googlecloud-original.svg"
      },
      {
        "name": "Microsoft Azure",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg"
      },
      {
        "name": "Jenkins",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jenkins/jenkins-original.svg"
      },
      {
        "name": "Docker",
        "url":
            "https://cdn.jsdelivr.net/npm/devicon/icons/docker/docker-original.svg"
      },
      {
        "name": "AWS",
        "url":
            "https://raw.githubusercontent.com/devicons/devicon/6910f0503efdd315c8f9b858234310c06e04d9c0/icons/amazonwebservices/amazonwebservices-original-wordmark.svg"
      },
      {
        "name": "Firebase",
        "url":
            "https://cdn.jsdelivr.net/npm/devicon/icons/firebase/firebase-original.svg"
      },
    ],
    "Databases": [
      {
        "name": "MySQL",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg"
      },
      {
        "name": "MS SQL Server",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/microsoftsqlserver/microsoftsqlserver-plain.svg"
      },
      {
        "name": "MongoDB",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mongodb/mongodb-original.svg"
      },
      {
        "name": "GraphQL",
        "url":
            "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/graphql/graphql-plain.svg"
      },
      {
        "name": "PostgreSQL",
        "url":
            "https://cdn.jsdelivr.net/npm/devicon/icons/postgresql/postgresql-original.svg"
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width <= 620;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 40),
          child: Text.rich(
              TextSpan(text: "SKILLS", children: [
                TextSpan(
                    text: "\nI'm best at",
                    style: Theme.of(context).textTheme.headlineSmall!)
              ]),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge!),
        ),
        SizedBox(height: 10),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 15,
          runSpacing: 15,
          children: [
            ...skillIcons.entries.map((cat) {
              var key = cat.key;
              bool isLast = cat.key == skillIcons.entries.last.key;
              return Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    border: isLast
                        ? null
                        : isMobile
                            ? Border(bottom: BorderSide(color: Colors.black))
                            : Border(right: BorderSide(color: Colors.black))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        key,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                        height: 200,
                        width: 200,
                        child: Stack(children: _buildHoneycombIcons(cat.value)))
                  ],
                ),
              );
            }),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildHoneycombIcons(List<Map<String, String>> icons) {
    List<Widget> iconsh = [];
    int index = 0;
    for (int row = 0; row < 2; row++) {
      for (int col = 0; col < 3; col++) {
        double x = col * 40 * 1.5; // X offset
        double y = row * 40 * sqrt(3); // Y offset

        if (col % 2 == 1) {
          y += 40 * sqrt(3) / 2; // Offset alternate columns
        }
        if (index >= icons.length) continue;
        var icon = icons.elementAt(index++);
        var skillName = icon['name']!;
        var iconUrl = icon['url']!;
        iconsh.add(Positioned(
            left: x,
            top: y,
            child: SkillIcon(skillName: skillName, iconUrl: iconUrl)));
      }
    }
    return iconsh;
  }
}
