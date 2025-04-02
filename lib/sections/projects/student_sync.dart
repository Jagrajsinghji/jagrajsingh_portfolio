import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/theme/theme_provider.dart';
import 'package:jagrajsingh_portfolio/utils/my_urls.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentSync extends StatelessWidget {
  const StudentSync({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.read<ThemeProvider>();
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 700,
                child: Text.rich(
                  TextSpan(
                    text: "StudentSync ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "is a platform designed exclusively for college students to connect, collaborate, and grow.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "📍 Location-Based Feed: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.greenAccent.shade200,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Discover nearby posts, hiring events, and student activities.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "🎓 Skill Matchmaking: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.orangeAccent.shade200,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Find students with skills you want to learn or teach.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "💬 Connect & Chat: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightBlueAccent.shade100,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Send connection requests and chat with students nearby.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "⭐ Skill Ratings: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple.shade100,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Rate students' skills to ensure credibility and trust.",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "🚀 Check here, it' open source!:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepOrange.shade200,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (await canLaunchUrl(
                            MyURLs.studentSyncAppGithubLink)) {
                          launchUrl(MyURLs.studentSyncAppGithubLink);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      ),
                      child: Text("Mobile Application",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (await canLaunchUrl(
                            MyURLs.studentSyncbackendGithubLink)) {
                          launchUrl(MyURLs.studentSyncbackendGithubLink);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      ),
                      child: Text("Backend",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, offset: Offset(15, 15)),
                      BoxShadow(
                          color: Colors.black26, offset: Offset(-15, -15)),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                height: 300,
                width: 300,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/projects/studentsync.png",
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (rect) {
                    return LinearGradient(colors: [
                      themeProvider.studentSyncColor,
                      Colors.blue,
                      themeProvider.studentSyncColor,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                        .createShader(rect);
                  },
                  child: Text("Student Sync",
                      style: Theme.of(context).textTheme.headlineLarge!),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
