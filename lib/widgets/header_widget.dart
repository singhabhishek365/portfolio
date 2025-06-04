import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600; // Define mobile breakpoint

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 10 : 20,
            horizontal: isMobile ? 20 : 40,
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildAnimatedText(),
                    const SizedBox(height: 10),
                    _buildNavigationButtons(
                        isMobile: isMobile, context: context),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAnimatedText(),
                    _buildNavigationButtons(
                        isMobile: isMobile, context: context),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildAnimatedText() {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TypewriterAnimatedText(
          'Abhishek Singh',
          textStyle: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
              letterSpacing: .5,
            ),
          ),
          speed: const Duration(milliseconds: 150),
        ),
        FadeAnimatedText(
          'Let\'s build something amazing.',
          duration: const Duration(seconds: 3),
          textStyle: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
              letterSpacing: .5,
            ),
          ),
        ),
        ScaleAnimatedText(
          "Feel free to visit the contact section—excited to collaborate with you!",
          duration: const Duration(seconds: 5),
          textStyle: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              overflow: TextOverflow.fade,
              color: Colors.black,
              letterSpacing: .5,
            ),
          ),
        ),
      ],
      isRepeatingAnimation: true,
      onTap: () {
        log("pressed");
      },
    );
  }

  Widget _buildNavigationButtons(
      {required bool isMobile, required BuildContext context}) {
    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.center : MainAxisAlignment.end,
      children: [
        _buildTextButton('About', '/about', isMobile, context),
        const SizedBox(width: 10),
        _buildTextButton('Projects', '/projects', isMobile, context),
        const SizedBox(width: 10),
        _buildTextButton('Contacts', '/contacts', isMobile, context),
      ],
    );
  }
  Widget _buildTextButton(
      String label, String route, bool isMobile, BuildContext context) {
    return TextButton(
      onPressed: () {
        GoRouter.of(context).go(route);
      },
      child: Text(
        label,
        style: GoogleFonts.comfortaa(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 14 : 16,
            color: Colors.black,
            letterSpacing: .5,
          ),
        ),
      ),
    );
  }
}
