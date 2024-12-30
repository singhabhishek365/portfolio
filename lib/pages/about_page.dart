import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abhishek_portfolio/widgets/header_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/helper.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                // Use LayoutBuilder to make the layout responsive
                bool isSmallScreen = constraints.maxWidth < 800;

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: isSmallScreen
                      ? Column(
                          // For small screens, stack content vertically
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildAboutText(context),
                            const SizedBox(height: 20),
                            const CircleAvatar(
                              radius: 120, // Adjust size for smaller screens
                              backgroundImage:
                                  AssetImage("assets/png/abhi.webp"),
                            ),
                          ],
                        )
                      : Row(
                          // For larger screens, arrange content horizontally
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildAboutText(context),
                            ),
                            const SizedBox(width: 30),
                            const Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                  radius: 250,
                                  backgroundImage:
                                      AssetImage("assets/png/abhi.webp")),
                            ),
                          ],
                        ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFDC435),
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.black.withOpacity(0.2),
                  elevation: 5,
                ),
                onPressed: () async {
                  await Helper.launchUrlFunc(
                      "https://drive.google.com/file/d/1-sEr9lozAGiw2uIU7BavypamSrH62xF6/view?usp=sharing");
                },
                child: Text(
                  'Resume',
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  // Widget to build the "About Me" section
  Widget _buildAboutText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'I am a passionate Mobile and Web Developer with 4+ years of experience, specializing in Flutter and cross-platform development. My career journey reflects my dedication to self-learning and continuous improvement.\n\n'
          'Key Highlights:\n'
          '- Expertise in Flutter: Proficient in developing scalable and intuitive mobile and web applications.\n'
          '- Technical Lead: Successfully transitioned from an IoT role to leading app development projects.\n'
          '- DSA Enthusiast: Strong foundation in Data Structures and Algorithms, enabling efficient problem-solving.\n'
          '- ERPNext Specialist: Hands-on experience in ERPNext for streamlined business solutions.\n'
          '- Proven Track Record: Delivered impactful and user-centric applications tailored to diverse client needs.\n'
          '- Passionate Learner: Constantly exploring advanced technologies and frameworks to stay ahead in the field.\n\n'
          'With a commitment to creating meaningful digital experiences, I strive to bridge the gap between technology and user satisfaction while contributing to impactful projects.',
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(
              fontSize: 16,
              height: 1.5, // Adds better line spacing for readability
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          textAlign: TextAlign.justify, // Aligns text for better readability
        ),
      ],
    );
  }
}
