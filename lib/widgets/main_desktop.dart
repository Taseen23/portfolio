import 'package:flutter/material.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      width: screenSize.width,
      color: Colors.white,
      child: Column(
        children: [
          // Top Header Text
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Column(
              children: [
                Text(
                  "Taseen Alam Dehan",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Serif',
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Serif',
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Dhaka Bangladesh",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Serif',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Main Content Area: 3 Columns
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column: Biography, Contact, Services
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("BIOGRAPHY"),
                    const SizedBox(height: 15),
                    const Text(
                      "Work for money and\ndesign for love!\nI'm Bruno, an UI/UX\nInteraction Designer based\nin Poland",
                      style: TextStyle(
                          fontSize: 14, height: 1.6, color: Colors.black87),
                    ),
                    const SizedBox(height: 40),
                    _buildSectionTitle("CONTACT"),
                    const SizedBox(height: 15),
                    const Text(
                      "Warsaw, Poland\nhello@brunoerdison.com\n+68 3568 89 86",
                      style: TextStyle(
                          fontSize: 14, height: 1.6, color: Colors.black87),
                    ),
                    const SizedBox(height: 40),
                    _buildSectionTitle("SERVICES"),
                    const SizedBox(height: 15),
                    const Text(
                      "Website Design\nMobile Application Design\nAnimation",
                      style: TextStyle(
                          fontSize: 14, height: 1.6, color: Colors.black87),
                    ),
                  ],
                ),
              ),

              // Center Column: Oval Image
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    width: 240,
                    height: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      image: const DecorationImage(
                        image: AssetImage("assets/1772730179478.JPG"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                    ),
                  ),
                ),
              ),

              // Right Column: Statistics
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildRightStat("YEARS OF\nEXPERIENCE", "2.5"),
                    const SizedBox(height: 50),
                    _buildRightStat("SATISFACTION\nCLIENTS", "100%"),
                    const SizedBox(height: 50),
                    _buildRightStat("PROJECTS DONE", "15+"),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 80),

          // Bottom Logos Row
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 40.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       _buildLogoPlaceholder("BLB"),
          //       _buildLogoPlaceholder("W"),
          //       _buildLogoPlaceholder("SERENITY"),
          //       _buildLogoPlaceholder("ARCHIVE"),
          //       _buildLogoPlaceholder("CREATIVE"),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
        color: Colors.grey.shade400,
      ),
    );
  }

  Widget _buildRightStat(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          textAlign: TextAlign.end,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Colors.grey.shade400,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildLogoPlaceholder(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w900,
        color: Colors.grey.shade300,
        letterSpacing: 1.5,
      ),
    );
  }
}
