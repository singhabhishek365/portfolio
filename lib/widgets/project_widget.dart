import 'package:abhishek_portfolio/model/projects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsWidget extends StatelessWidget {
  final Projects? projectList;
  const ProjectsWidget({super.key, this.projectList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left Container
            Container(
              height: 250,
              width: 300,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projectList!.projectName!,
                      style: GoogleFonts.comfortaa(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      projectList!.projectDescription!,
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Right Container with Image
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(8),
              ),
              child: Container(
                height: 250,
                width: 300,
                color: Colors.blue, // Background color for the right container
                child: Image.asset(
                  projectList!.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );

    // return Column(
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Container(
    //           decoration: const BoxDecoration(
    //               color: Colors.black,
    //               borderRadius: BorderRadius.only(
    //                   bottomLeft: Radius.circular(8),
    //                   topLeft: Radius.circular(8))),
    //           height: 250,
    //           width: 300,
    //         ),
    //         Container(
    //           height: 250,
    //           width: 300,
    //           decoration: const BoxDecoration(
    //               color: Colors.blue,
    //               borderRadius: BorderRadius.only(
    //                   bottomRight: Radius.circular(8),
    //                   topRight: Radius.circular(8))),
    //           child: Image.asset(
    //             projectList!.image!,
    //             fit: BoxFit.fill,
    //           ),
    //         )
    //       ],
    //     ),
    //     const SizedBox(
    //       height: 40,
    //     )
    //   ],
    // );
  }
}
