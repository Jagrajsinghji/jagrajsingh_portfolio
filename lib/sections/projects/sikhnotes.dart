import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/theme/theme_provider.dart';
import 'package:jagrajsingh_portfolio/utils/my_urls.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SikhNotes extends StatelessWidget {
  const SikhNotes({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
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
                      "assets/projects/sikhnotes.jpg",
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
                    return LinearGradient(
                      colors: [
                        themeProvider.sikhNotesColor1,
                        themeProvider.sikhNotesColor2
                      ],
                    ).createShader(rect);
                  },
                  child: Text("Sikh Notes",
                      style: Theme.of(context).textTheme.headlineLarge!),
                ),
              )
            ],
          ),
        ),
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
                    text: "Sikh Notes ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "is an initiative to enlighten the world with the knowledge of Sikh History.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "📜 18 Axiomatic Collections: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.amber.shade200,
                        ),
                      ),
                      TextSpan(
                        text: "Includes Gurbani literature in PDF format.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "🎧 Listen to: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightBlueAccent.shade100,
                        ),
                      ),
                      TextSpan(
                        text: "Nitnem, Audio Books, and Sehaj Path.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "🎥 Watch: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.tealAccent.shade100,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Hundreds and thousands of Sikhism-related videos.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "🎁 Special Gift - 'Santheya': ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple.shade400,
                        ),
                      ),
                      TextSpan(
                        text: "Learn 'Santheya' at home free of cost.\n\n",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "🔴 Live 24x7: ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.yellow.shade700,
                        ),
                      ),
                      TextSpan(
                        text:
                            "Listen to live Gurbani from Sri Darbar Sahib (Golden Temple).",
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
                      "🚀 Check it out here!:",
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
                            MyURLs.sikhNotesGooglePlayLink)) {
                          launchUrl(MyURLs.sikhNotesGooglePlayLink);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87, // Subtle background
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      ),
                      child: Text("Google Play",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (await canLaunchUrl(
                            MyURLs.sikhNotesAppleStoreLink)) {
                          launchUrl(MyURLs.sikhNotesAppleStoreLink);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      ),
                      child: Text("App Store",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
