import 'package:flutter/material.dart';

import 'apparel_marketplace.dart';
import 'sikhnotes.dart';
import 'student_sync.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 40),
            child: Text.rich(
                TextSpan(text: "PROJECTS", children: [
                  TextSpan(
                      text: "\nI'm proud of",
                      style: Theme.of(context).textTheme.headlineSmall!)
                ]),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge!),
          ),
          Expanded(
            flex: 0,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SikhNotes(),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                  indent: 100,
                  endIndent: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: StudentSync(),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                  indent: 100,
                  endIndent: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ApparelMarketplace(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
