import 'package:abhishek_portfolio/model/projects.dart';
import 'package:abhishek_portfolio/utils/helper.dart';
import 'package:abhishek_portfolio/widgets/header_widget.dart';
import 'package:abhishek_portfolio/widgets/project_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottom_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _url;

  @override
  void initState() {
    super.initState();
    _url = "https://linkedin.com/in/abhishek-s-533986187/";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(builder: (context, constraints) {
          // Use LayoutBuilder to make the layout responsive
          bool isSmallScreen = constraints.maxWidth < 800;
          return Stack(
            children: [
              // Background with animation
              // Positioned(
              //   top: 0,
              //   right: 0,
              //   child: WidgetAnimator(
              //     atRestEffect: WidgetRestingEffects.swing(),
              //     child: Image.asset(
              //       height: size.height * 0.6,
              //       "assets/png/yellow-bg.png",
              //     ),
              //   ),
              // ),
              isSmallScreen
                  ? const SizedBox()
                  : Positioned(
                      top: size.height * 0.1, // Add space from the top
                      right: size.width * 0.01,
                      child: getprofileImage(size)),

              Column(
                children: [
                  const HeaderWidget(),

                  isSmallScreen ? getprofileImage(size) : const SizedBox(),

                  // Introduction Section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'Mobile and Web Developer',
                              textStyle: GoogleFonts.comfortaa(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFDC435),
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          isRepeatingAnimation: false,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Hello, my name is \nAbhishek Singh',
                          style: GoogleFonts.comfortaa(
                            textStyle: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'I am a passionate developer specializing in Flutter and React, creating seamless cross-platform \napplications with intuitive user interfaces and efficient performance. My expertise lies \nin building scalable, maintainable, and visually engaging solutions tailored to client needs.\nI strive to deliver impactful software that bridges technology and user satisfaction.',
                          maxLines: 6,
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFDC435),
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                shadowColor: Colors.black.withOpacity(0.2),
                                elevation: 5,
                              ),
                              onPressed: () {},
                              child: Text(
                                'Projects',
                                style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side:
                                    const BorderSide(color: Color(0xFFFDC435)),
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () async {
                                await Helper.launchUrlFunc(_url);
                              },
                              child: const Text('LinkedIn'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Projects Section
                  const SizedBox(height: 30),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Projects',
                          style: GoogleFonts.comfortaa(
                            textStyle: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          height: 3,
                          width: 80,
                          margin: const EdgeInsets.only(top: 10),
                          color: const Color(0xFFFDC435),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projectList.length,
                    itemBuilder: (context, index) {
                      return ProjectsWidget(projectList: projectList[index]);
                    },
                  ),
                  const SizedBox(height: 60),
                  const BottomIcons(),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget getprofileImage(Size size) {
    return CircleAvatar(
      radius: size.height * 0.2,
      backgroundImage:
          const AssetImage("assets/png/abhi.webp"), // Add image here
    );
  }
}
