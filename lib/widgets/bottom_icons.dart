import 'package:abhishek_portfolio/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomIcons extends StatelessWidget {
  final String email =
      "singhabhishek2735@gmail.com"; 
  final String subject = "Hiring Flutter Developer";
  final String body = "Hey Abhishek,\n\n"
      "We would love to hire you for our project. Please let us know when we can connect at the earliest.\n\n"
      "Best regards,\n[Your Name/Company Name]";
  const BottomIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Helper.launchUrlFunc(
                    "https://www.instagram.com/r15_rider_singh/?hl=en");
              }, 
              child: Image.asset(
                "assets/png/Vector.png",
                width: 25,
                height: 25,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                Helper.launchUrlFunc(
                    "https://linkedin.com/in/abhishek-s-533986187/");
              },
              child: Image.asset(
                "assets/png/Group.png",
                width: 25,
                height: 25,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                openEmail(email, subject, body);
              },
              child: Image.asset(
                "assets/png/mail.png",
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Abhishek Singh 2024',
          style: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }

  Future<void> openEmail(String email, String subject, String body) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      // query:
      //     'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw "Could not launch $emailUri";
    }
  }
}
