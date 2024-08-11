import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../utils/project_utils.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Color.fromARGB(255, 137, 141, 230),
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // Work projects title
          const Text(
            "Work projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 50),
          // Work projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < hobbyProjectUtils.length; i++)
                  InkWell(
                    onTap: () => hobbyProjectUtils[i].ontap,
                    child: ProjectCardWidget(
                      project: hobbyProjectUtils[i],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          // Hobby projects title

          const SizedBox(height: 50),
          // Hobby projects cards
        ],
      ),
    );
  }
}
