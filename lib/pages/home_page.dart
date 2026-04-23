import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/home_controller.dart';
import '../constants/myinfo.dart';
import '../models/home_model.dart';

class HomePage extends StatelessWidget {
  static final Uri _linkedInProfileUrl = Uri.parse(
    'https://www.linkedin.com/in/taseen23?utm_source=share_via&utm_content=profile&utm_medium=member_android',
  );

  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());
  final GlobalKey ctaKey = GlobalKey();

  Future<void> _openLinkedInProfile() async {
    await launchUrl(
      _linkedInProfileUrl,
      mode: LaunchMode.externalApplication,
    );
  }

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
          _buildWorkSection(context),
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
          _buildWorkSection(context),
          const SizedBox(height: 40),
          _buildCoreStackSection(context),
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
              color: Colors.cyan.withValues(alpha: 0.1),
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
            color: Colors.black.withValues(alpha: 0.05),
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
                ? const Color(0xFF00B4D8).withValues(alpha: 0.1)
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

  // --- Work Section ---
  Widget _buildWorkSection(BuildContext context) {
    final bool isDesktop = context.width > 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100 : 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _workSectionHeader(isDesktop: isDesktop),
              const SizedBox(height: 44),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= 820) {
                    return _workGrid(constraints.maxWidth, columns: 3);
                  }

                  if (constraints.maxWidth >= 560) {
                    return _workGrid(constraints.maxWidth, columns: 2);
                  }

                  return _workGrid(constraints.maxWidth, columns: 1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _workSectionHeader({required bool isDesktop}) {
    final double titleSize = isDesktop ? 58 : 40;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CRAFTING",
          style: GoogleFonts.outfit(
            fontSize: titleSize,
            fontWeight: FontWeight.w900,
            height: 0.95,
            color: const Color(0xFF111827),
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF00B4D8), Color(0xFF9100FF)],
          ).createShader(bounds),
          child: Text(
            "DIGITAL SOULS",
            style: GoogleFonts.outfit(
              fontSize: titleSize,
              fontWeight: FontWeight.w900,
              height: 0.98,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: isDesktop ? 560 : double.infinity,
          child: Text(
            "Exploring the intersection of high-performance mobile engineering and fluid aesthetic interfaces. Every pixel is a neuro-connection.",
            style: GoogleFonts.outfit(
              fontSize: isDesktop ? 14 : 13,
              color: Colors.black45,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _workGrid(double maxWidth, {required int columns}) {
    const double gap = 24;
    final double cardWidth =
        columns == 1 ? maxWidth : (maxWidth - (gap * (columns - 1))) / columns;
    final double wideCardWidth =
        columns == 3 ? (cardWidth * 2) + gap : maxWidth;
    final bool compactWideCard = columns == 1;

    return Wrap(
      spacing: gap,
      runSpacing: gap,
      children: [
        SizedBox(
          width: cardWidth,
          child: _workCard(
            title: "QTPAY",
            description:
                "A companion money transfer app with native banking UX, biometric exchange previews, secure auth, and teller-style transaction verification.",
            accentColor: const Color(0xFF00B4D8),
            icon: Icons.payments_outlined,
            visual: _qtPayVisual(),
            tags: const ["PAYTECH", "MOBILE", "FINANCE"],
          ),
        ),
        SizedBox(
          width: cardWidth,
          child: _workCard(
            title: "APPDEVS FINTECH",
            description:
                "A command center for market analytics, exchange monitoring, and trading signals with realtime charting and operational dashboards.",
            accentColor: const Color(0xFF9100FF),
            icon: Icons.show_chart_rounded,
            visual: _marketChartVisual(),
            tags: const ["DASHBOARD", "DATA", "FINTECH"],
          ),
        ),
        SizedBox(
          width: cardWidth,
          child: _workCard(
            title: "ALL CONNECT",
            description:
                "A digital identity platform with secure facial mapping, lightweight profile flows, and polished connection management.",
            accentColor: const Color(0xFF00B4D8),
            icon: Icons.badge_outlined,
            visual: _connectVisual(),
            tags: const ["IDENTITY", "NETWORK", "PROFILE"],
          ),
        ),
        SizedBox(
          width: wideCardWidth,
          child: _carboWorkCard(compact: compactWideCard),
        ),
        SizedBox(
          width: cardWidth,
          child: _workCard(
            title: "SALON HUB",
            description:
                "An appointment platform for beauty professionals with schedule controls, treatment tracking, and client pulse metrics.",
            accentColor: const Color(0xFF00B4D8),
            icon: Icons.content_cut_rounded,
            visual: _salonHubVisual(),
            tags: const ["BOOKING", "SERVICE", "MOBILE"],
          ),
        ),
        SizedBox(
          width: cardWidth,
          child: _workCard(
            title: "ADSMART",
            description:
                "A growth dashboard for campaign operators with spend summaries, creative insights, and clean reporting workflows.",
            accentColor: const Color(0xFF9100FF),
            icon: Icons.campaign_outlined,
            visual: _adSmartVisual(),
            tags: const ["ADS", "ANALYTICS", "WEB"],
          ),
        ),
      ],
    );
  }

  Widget _workCard({
    required String title,
    required String description,
    required Color accentColor,
    required IconData icon,
    required Widget visual,
    required List<String> tags,
  }) {
    return Container(
      height: 390,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: SizedBox(
              height: 190,
              width: double.infinity,
              child: visual,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.outfit(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF111827),
                          ),
                        ),
                      ),
                      Icon(icon, color: accentColor, size: 16),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(
                      fontSize: 11,
                      color: Colors.black45,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tags
                        .map(
                          (tag) => _workTag(
                            tag,
                            color: accentColor,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _carboWorkCard({required bool compact}) {
    return Container(
      height: compact ? 500 : 390,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: compact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8)),
                    child: _carboVisual(),
                  ),
                ),
                _carboContent(),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.horizontal(left: Radius.circular(8)),
                    child: _carboVisual(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _carboContent(),
                ),
              ],
            ),
    );
  }

  Widget _carboContent() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "CARBO",
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            "A full-stack salon and logistics booking platform with dispatch pricing, team management, and lifecycle automation.",
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.outfit(
              fontSize: 12,
              color: Colors.black45,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            "EXPLORE CASE STUDY",
            style: GoogleFonts.outfit(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.6,
              color: const Color(0xFF00B4D8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _workTag(String text, {required Color color}) {
    return Text(
      text,
      style: GoogleFonts.outfit(
        fontSize: 8,
        fontWeight: FontWeight.w900,
        letterSpacing: 1.1,
        color: color,
      ),
    );
  }

  Widget _qtPayVisual() {
    return Container(
      color: const Color(0xFFF3F7FA),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 42,
            top: 42,
            child: Transform.rotate(
              angle: -0.08,
              child: _phoneShell(
                width: 108,
                height: 176,
                backgroundColor: const Color(0xFF0C1118),
                accentColor: const Color(0xFF00B4D8),
              ),
            ),
          ),
          Positioned(
            right: 38,
            top: 58,
            child: Transform.rotate(
              angle: 0.04,
              child: _phoneShell(
                width: 98,
                height: 162,
                backgroundColor: const Color(0xFFEDF4F6),
                accentColor: const Color(0xFF111827),
                isLight: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _marketChartVisual() {
    return Container(
      color: const Color(0xFF0B1117),
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _MarketChartPainter(),
            ),
          ),
          Positioned(
            top: 18,
            left: 18,
            right: 18,
            child: Row(
              children: [
                _terminalDot(const Color(0xFFFF5F57)),
                const SizedBox(width: 6),
                _terminalDot(const Color(0xFFFFBD2E)),
                const SizedBox(width: 6),
                _terminalDot(const Color(0xFF28C840)),
                const Spacer(),
                Container(
                  height: 8,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _connectVisual() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/1772730179478.JPG",
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                const Color(0xFF07131B).withValues(alpha: 0.65),
              ],
            ),
          ),
        ),
        Positioned(
          left: 18,
          bottom: 18,
          child: Row(
            children: [
              _statusPill("SYNCED"),
              const SizedBox(width: 8),
              _statusPill("ID OK"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _carboVisual() {
    return Container(
      color: const Color(0xFFF3F4F7),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 74,
            child: Container(
              height: 182,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF05090D), Color(0xFF161F24)],
                ),
                border: Border(
                  top: BorderSide(color: Colors.white.withValues(alpha: 0.18)),
                  bottom:
                      BorderSide(color: Colors.black.withValues(alpha: 0.16)),
                ),
              ),
              child: CustomPaint(
                painter: _SoftWavePainter(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 72,
            child: Container(
              height: 18,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.08),
                    Colors.white.withValues(alpha: 0.72),
                    Colors.black.withValues(alpha: 0.08),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _salonHubVisual() {
    return Container(
      color: const Color(0xFFE9F7FA),
      child: Center(
        child: Container(
          width: 118,
          height: 178,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF1B2430),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 24,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF28BFD5),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.face_retouching_natural,
                  color: Colors.white,
                  size: 74,
                ),
                Positioned.fill(
                  child: CustomPaint(
                    painter: _HeartbeatPainter(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _adSmartVisual() {
    return Container(
      color: const Color(0xFFEAF5FA),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 190,
              height: 112,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _miniLine(width: 58, color: const Color(0xFF00B4D8)),
                          const SizedBox(height: 8),
                          _miniLine(width: 80),
                          const SizedBox(height: 6),
                          _miniLine(width: 66),
                          const Spacer(),
                          Row(
                            children: [
                              _metricBlock(const Color(0xFF00B4D8)),
                              const SizedBox(width: 6),
                              _metricBlock(const Color(0xFF9100FF)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00B4D8).withValues(alpha: 0.14),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.campaign_rounded,
                        color: Color(0xFF00B4D8),
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 220,
              height: 10,
              decoration: BoxDecoration(
                color: const Color(0xFFC9D6DE),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _phoneShell({
    required double width,
    required double height,
    required Color backgroundColor,
    required Color accentColor,
    bool isLight = false,
  }) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF151B23),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 22,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _miniLine(
              width: width * 0.36,
              color: isLight ? const Color(0xFF111827) : Colors.white,
            ),
            const SizedBox(height: 14),
            _miniLine(width: width * 0.56, color: accentColor),
            const SizedBox(height: 8),
            _miniLine(width: width * 0.44),
            const SizedBox(height: 8),
            _miniLine(width: width * 0.50),
            const Spacer(),
            Container(
              height: 34,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: isLight ? 0.12 : 0.22),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
      ),
      child: Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 8,
          fontWeight: FontWeight.w900,
          letterSpacing: 1,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _terminalDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _miniLine({required double width, Color? color}) {
    return Container(
      width: width,
      height: 5,
      decoration: BoxDecoration(
        color: color ?? Colors.black.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _metricBlock(Color color) {
    return Expanded(
      child: Container(
        height: 24,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
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
                Wrap(
                  spacing: 10,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "MERGING LOGIC",
                      style: GoogleFonts.outfit(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "&",
                      style: GoogleFonts.outfit(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF00B4D8),
                      ),
                    ),
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
            label: const Text(MyInfo.initiateContact),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B2430),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _socialIconButton(
                icon: FontAwesomeIcons.linkedinIn,
                tooltip: 'LinkedIn',
                onPressed: _openLinkedInProfile,
              ),
              const SizedBox(width: 12),
              _socialIconButton(
                icon: FontAwesomeIcons.facebookF,
                tooltip: 'Facebook',
                onPressed: () {},
              ),
              const SizedBox(width: 12),
              _socialIconButton(
                icon: FontAwesomeIcons.twitter,
                tooltip: 'Twitter',
                onPressed: () {},
              ),
            ],
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

  Widget _socialIconButton({
    required FaIconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1B2430),
        fixedSize: const Size.square(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black.withValues(alpha: 0.08)),
        ),
      ),
      icon: FaIcon(icon, size: 18),
    );
  }

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
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
        border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
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
                    color: Colors.cyan.withValues(alpha: 0.1),
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
        border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
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

class _MarketChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint gridPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.07)
      ..strokeWidth = 1;

    for (int i = 1; i < 5; i++) {
      final double dy = size.height * i / 5;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), gridPaint);
    }

    for (int i = 1; i < 6; i++) {
      final double dx = size.width * i / 6;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), gridPaint);
    }

    final Path chartPath = Path()
      ..moveTo(size.width * 0.06, size.height * 0.66)
      ..lineTo(size.width * 0.16, size.height * 0.56)
      ..lineTo(size.width * 0.25, size.height * 0.61)
      ..lineTo(size.width * 0.34, size.height * 0.42)
      ..lineTo(size.width * 0.45, size.height * 0.50)
      ..lineTo(size.width * 0.55, size.height * 0.34)
      ..lineTo(size.width * 0.66, size.height * 0.45)
      ..lineTo(size.width * 0.78, size.height * 0.39)
      ..lineTo(size.width * 0.91, size.height * 0.30);

    final Paint chartPaint = Paint()
      ..color = const Color(0xFF28C840)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(chartPath, chartPaint);

    final Path dropPath = Path()
      ..moveTo(size.width * 0.32, size.height * 0.42)
      ..lineTo(size.width * 0.39, size.height * 0.70)
      ..lineTo(size.width * 0.48, size.height * 0.58);

    final Paint dropPaint = Paint()
      ..color = const Color(0xFFFF5F57)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(dropPath, dropPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SoftWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint glowPaint = Paint()
      ..color = const Color(0xFF00B4D8).withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.18, size.height * 0.55),
      size.width * 0.18,
      glowPaint,
    );

    final Path wavePath = Path()
      ..moveTo(0, size.height * 0.58)
      ..cubicTo(
        size.width * 0.22,
        size.height * 0.42,
        size.width * 0.36,
        size.height * 0.72,
        size.width * 0.52,
        size.height * 0.54,
      )
      ..cubicTo(
        size.width * 0.66,
        size.height * 0.38,
        size.width * 0.78,
        size.height * 0.70,
        size.width,
        size.height * 0.48,
      );

    final Paint wavePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.18)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HeartbeatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path()
      ..moveTo(size.width * 0.12, size.height * 0.56)
      ..lineTo(size.width * 0.34, size.height * 0.56)
      ..lineTo(size.width * 0.40, size.height * 0.43)
      ..lineTo(size.width * 0.47, size.height * 0.70)
      ..lineTo(size.width * 0.55, size.height * 0.50)
      ..lineTo(size.width * 0.64, size.height * 0.56)
      ..lineTo(size.width * 0.88, size.height * 0.56);

    final Paint paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.85)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
