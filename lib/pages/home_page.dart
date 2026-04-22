import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';
import '../constants/myinfo.dart';
import '../models/home_model.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final GlobalKey ctaKey = GlobalKey();

  void _scrollToCTA() {
    final context = ctaKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      bottomNavigationBar: context.width <= 900 ? _buildBottomNavBar() : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            return _buildDesktopLayout(context);
          } else {
            return _buildMobileLayout(context);
          }
        },
      ),
    );
  }

  // --- Desktop Layout ---
  Widget _buildDesktopLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          _buildHeroSection(context, isDesktop: true),
          const SizedBox(height: 100),
          _buildMergingLogicSection(context),
          const SizedBox(height: 100),
          _buildCapabilitiesSection(context),
          const SizedBox(height: 100),
          _buildCTASection(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  // --- Mobile Layout ---
  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMobileHeader(context),
          _buildMobileHeroSection(context),
          const SizedBox(height: 40),
          _buildCoreStackSection(context),
          const SizedBox(height: 40),
          _buildFeaturedWorkSection(context),
          const SizedBox(height: 40),
          _buildFooter(context),
        ],
      ),
    );
  }

  // --- Header ---
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      child: Row(
        children: [
          Text(
            MyInfo.appName,
            style: GoogleFonts.outfit(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF00B4D8),
            ),
          ),
          const Spacer(),
          _navItem("WORK"),
          const SizedBox(width: 30),
          _navItem("LABS"),
          const SizedBox(width: 30),
          _navItem("ARCHIVE"),
          const SizedBox(width: 30),
          _navItem("ABOUT"),
          const SizedBox(width: 50),
          ElevatedButton(
            onPressed: _scrollToCTA,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00B4D8),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text("CONNECT"),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            MyInfo.appName,
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF00B4D8),
            ),
          ),
          ElevatedButton(
            onPressed: _scrollToCTA,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00B4D8),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text("CONNECT"),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return InkWell(
      onTap: () {},
      child: Text(
        title,
        style: GoogleFonts.outfit(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
      ),
    );
  }

  // --- Hero Section ---
  Widget _buildHeroSection(BuildContext context, {required bool isDesktop}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF000000), Color(0xFF9100FF)],
                  ).createShader(bounds),
                  child: Text(
                    MyInfo.heroTitle,
                    style: GoogleFonts.outfit(
                      fontSize: 80,
                      fontWeight: FontWeight.w900,
                      height: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 500,
                  child: Text(
                    MyInfo.heroSubtitle,
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      color: Colors.black45,
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    _primaryButton(MyInfo.viewEcosystem),
                    const SizedBox(width: 20),
                    _secondaryButton(MyInfo.reachOut),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/phone_mockup.png",
                  height: 600,
                ),
                Positioned(
                  left: 0,
                  top: 150,
                  child: _floatingTag("REACT NATIVE"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHeroSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.cyan.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.circle, color: Colors.cyan, size: 8),
                const SizedBox(width: 8),
                Text(
                  "AVAILABLE FOR PROJECTS",
                  style: GoogleFonts.outfit(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00B4D8), Color(0xFF9100FF)],
            ).createShader(bounds),
            child: Text(
              MyInfo.engineeringFuture,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 42,
                fontWeight: FontWeight.w900,
                height: 1.1,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            MyInfo.heroSubtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: Colors.black45,
            ),
          ),
          const SizedBox(height: 30),
          _primaryButton(MyInfo.viewPortfolio, fullWidth: true),
          const SizedBox(height: 50),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/phone_mockup.png",
                height: 450,
              ),
              Positioned(
                top: 50,
                right: 20,
                child: _floatingTag("SWIFT"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavItem(Icons.grid_view_rounded, "FEED"),
          _bottomNavItem(Icons.location_on_outlined, "NEXUS", isActive: true),
          _bottomNavItem(Icons.storage_outlined, "VAULT"),
          _bottomNavItem(Icons.person_outline, "PROFILE"),
        ],
      ),
    );
  }

  Widget _bottomNavItem(IconData icon, String label, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF00B4D8).withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: isActive ? const Color(0xFF00B4D8) : Colors.black26,
            size: 24,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: isActive ? const Color(0xFF00B4D8) : Colors.black26,
          ),
        ),
      ],
    );
  }

  // --- Merging Logic Section ---
  Widget _buildMergingLogicSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/1772730179478.JPG",
                    height: 500,
                    width: 450,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00B4D8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          MyInfo.yearsOfCode,
                          style: GoogleFonts.outfit(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          MyInfo.yearsOfCodeText,
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "MERGING LOGIC",
                      style: GoogleFonts.outfit(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "&",
                      style: GoogleFonts.outfit(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF00B4D8),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "IMAGINATION",
                      style: GoogleFonts.outfit(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  MyInfo.mergingDesc,
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: controller.stats
                      .sublist(0, 2)
                      .map((stat) => _statBox(stat))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Capabilities Section ---
  Widget _buildCapabilitiesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyInfo.capabilitiesTitle,
            style: GoogleFonts.outfit(
              fontSize: 36,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            MyInfo.capabilitiesSubtitle,
            style: GoogleFonts.outfit(
              fontSize: 14,
              letterSpacing: 2,
              color: Colors.black38,
            ),
          ),
          const SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: _capabilityCard(controller.capabilities[0], large: true),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    _capabilityCard(controller.capabilities[1]),
                    const SizedBox(height: 20),
                    _capabilityCard(controller.capabilities[2]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Core Stack Section (Mobile) ---
  Widget _buildCoreStackSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "CORE STACK",
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 20),
          _capabilityCard(controller.capabilities[0]),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: _mobileStatCard(controller.capabilities[1])),
              const SizedBox(width: 15),
              Expanded(child: _mobileStatCard(controller.capabilities[2])),
            ],
          ),
        ],
      ),
    );
  }

  // --- Featured Work Section (Mobile) ---
  Widget _buildFeaturedWorkSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "FEATURED WORK",
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: const Color(0xFF00B4D8),
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MyInfo.cyberGenesis,
                style: GoogleFonts.outfit(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "ALL CASE\nSTUDIES",
                textAlign: TextAlign.right,
                style: GoogleFonts.outfit(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/cyber_genesis.png",
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _smallTag("MOBILE APP"),
                        const SizedBox(width: 10),
                        _smallTag("WEB3"),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      MyInfo.cyberGenesisDesc,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "LAUNCH PROJECT",
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF00B4D8),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- CTA Section ---
  Widget _buildCTASection(BuildContext context) {
    return Container(
      key: ctaKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00B4D8), Color(0xFF9100FF)],
            ).createShader(bounds),
            child: Text(
              MyInfo.ctaTitle,
              style: GoogleFonts.outfit(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 600,
            child: Text(
              MyInfo.ctaSubtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 18,
                color: Colors.black45,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.language),
            label: Text(MyInfo.initiateContact),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B2430),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Footer ---
  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    MyInfo.appName,
                    style: GoogleFonts.outfit(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    MyInfo.footerText,
                    style: GoogleFonts.outfit(
                      fontSize: 10,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _footerLink("TERMS"),
                  const SizedBox(width: 20),
                  _footerLink("PRIVACY"),
                  const SizedBox(width: 20),
                  _footerLink("TWITTER"),
                  const SizedBox(width: 20),
                  _footerLink("GITHUB"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _primaryButton(String text, {bool fullWidth = false}) {
    return Container(
      width: fullWidth ? double.infinity : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [Color(0xFF00B4D8), Color(0xFF9100FF)],
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _secondaryButton(String text) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        side: const BorderSide(color: Colors.black12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.outfit(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _floatingTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.circle, color: Color(0xFF9100FF), size: 10),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.outfit(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statBox(StatModel stat) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stat.value,
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF00B4D8),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            stat.label,
            style: GoogleFonts.outfit(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }

  Widget _capabilityCard(CapabilityModel model, {bool large = false}) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (large)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.cyan.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      _tagItem("ARCHITECTURE"),
                      const SizedBox(width: 10),
                      _tagItem("OPTIMIZATION"),
                    ],
                  ),
                ),
              if (!large) Icon(model.icon, color: const Color(0xFF9100FF)),
              if (large)
                const Icon(Icons.check_box, color: Color(0xFF00B4D8), size: 30),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            model.title,
            style: GoogleFonts.outfit(
              fontSize: large ? 28 : 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            model.description,
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: Colors.black45,
              height: 1.5,
            ),
          ),
          if (model.tags.isNotEmpty) ...[
            const SizedBox(height: 25),
            Row(
              children: model.tags.map((tag) => _techTag(tag)).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _mobileStatCard(CapabilityModel model) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(model.icon,
              color: model.title.contains("Interface")
                  ? Colors.purple
                  : Colors.cyan),
          const SizedBox(height: 15),
          Text(
            model.title,
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            model.description,
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tagItem(String text) {
    return Text(
      text,
      style: GoogleFonts.outfit(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF00B4D8),
      ),
    );
  }

  Widget _techTag(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _smallTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white30),
      ),
      child: Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _footerLink(String text) {
    return Text(
      text,
      style: GoogleFonts.outfit(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.black26,
      ),
    );
  }
}
