import 'package:flutter/material.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 40.0,
      ),
      width: double.maxFinite,
      child: Row(
        children: [
          // Left Nav Items
          TextButton(
            onPressed: () => onNavMenuTap(2), // Projects/Works
            child: const Text(
              "WORKS",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () => onNavMenuTap(3), // Contact
            child: const Text(
              "CONTACT",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.black,
              ),
            ),
          ),

          const Spacer(),

          // Center Logo
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.shield_outlined, size: 24, color: Colors.black),
              const Text(
                "BRUNO\nERDISON",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Right Social Icons
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.flutter_dash, size: 18, color: Colors.black),
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.code, size: 18, color: Colors.black),
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.facebook, size: 18, color: Colors.black),
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.language, size: 18, color: Colors.black),
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ],
      ),
    );
  }
}
