import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white.withOpacity(0.9),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'Abhishek Singh',
                textStyle: GoogleFonts.comfortaa(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                        letterSpacing: .5)),
                speed: const Duration(milliseconds: 150),
              ),
              FadeAnimatedText(
                'Let\'s build something amazing.',
                duration: const Duration(seconds: 3),
                textStyle: GoogleFonts.comfortaa(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                        letterSpacing: .5)),
              ),
              ScaleAnimatedText(
                "Feel free to visit the contact section—excited to collaborate with you!",
                duration: const Duration(seconds: 5),
                textStyle: GoogleFonts.comfortaa(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                        letterSpacing: .5)),
              ),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              log("pressed");
            },
          ),
          // Text(
          //   'Abhishek Singh',
          //   style: GoogleFonts.comfortaa(
          //     fontSize: 20,
          //     textStyle: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black,
          //         letterSpacing: .5),
          //   ),
          // ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                     context.go('/about');
                  },
                  child: Text(
                    'About',
                    style: GoogleFonts.comfortaa(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: .5),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    context.go('/project');
                  },
                  child: Text(
                    'Projects',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.bold,
                      textStyle: const TextStyle(
                          color: Colors.black, letterSpacing: .5),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    context.go('/contacts');
                  },
                  child: Text(
                    'Contacts',
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.bold,
                      textStyle: const TextStyle(
                          color: Colors.black, letterSpacing: .5),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
