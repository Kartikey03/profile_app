import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flip_card/flip_card.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String phoneNumber = "886499751";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BusinessCardScreen(),
    );
  }
}

class BusinessCardScreen extends StatelessWidget {
  final String phoneNumber = "886499751";

  const BusinessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = MediaQuery.of(context).padding;
    final safeAreaHeight = screenHeight - padding.top - padding.bottom;

    // Calculate responsive sizes
    final avatarRadius = screenWidth * 0.20; // 20% of screen width
    final nameSize = screenWidth * 0.12; // 12% of screen width
    final titleSize = screenWidth * 0.045; // 4.5% of screen width
    final cardFontSize = screenWidth * 0.042; // 4.2% of screen width
    final emailFontSize = screenWidth * 0.035; // Smaller for email
    final iconSize = screenWidth * 0.06;
    final smallIconSize = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: safeAreaHeight * 0.03,
              horizontal: screenWidth * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlipCard(
                  back: CircleAvatar(
                    radius: avatarRadius,
                    backgroundImage: AssetImage('assets/images/kartikey.png'),
                  ),
                  front: CircleAvatar(
                    radius: avatarRadius,
                    backgroundColor: Colors.teal.shade900,
                    child: Text(
                      "Tap to View Profile",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pacifico(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  speed: 300,
                ),
                SizedBox(height: safeAreaHeight * 0.02),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Kartikey Sharma',
                    style: GoogleFonts.pacifico(
                      fontSize: nameSize,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: safeAreaHeight * 0.01),
                Text(
                  "FLUTTER DEVELOPER",
                  style: GoogleFonts.sourceCodePro(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade100,
                    letterSpacing: 3.5,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.4,
                  height: safeAreaHeight * 0.02,
                  child: Divider(color: Colors.teal.shade100),
                ),

                // Contact Cards
                _buildContactCard(
                  context: context,
                  icon: Icons.phone,
                  text: "+91 8864997581",
                  fontSize: cardFontSize,
                  iconSize: iconSize,
                  smallIconSize: smallIconSize,
                  onPressed: () async {
                    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
                    if (!await launchUrl(phoneUri)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Could not launch phone dialer')),
                      );
                    }
                  },
                ),

                _buildContactCard(
                  context: context,
                  icon: Icons.email,
                  text: "info.kartik2003@gmail.com",
                  fontSize: emailFontSize,
                  iconSize: iconSize,
                  smallIconSize: smallIconSize,
                  onPressed: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'info.kartik2003@gmail.com',
                    );
                    if (!await launchUrl(emailLaunchUri)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Could not launch email app')),
                      );
                    }
                  },
                ),

                _buildContactCard(
                  context: context,
                  icon: Icons.home,
                  text: "Shastri Nagar, Meerut",
                  fontSize: cardFontSize,
                  iconSize: iconSize,
                  smallIconSize: smallIconSize,
                  onPressed: () async {
                    final Uri url = Uri.parse('https://maps.app.goo.gl/1VC85sKj5D49kz3a8?g_st=ac');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),

                _buildContactCard(
                  context: context,
                  icon: Icons.link_rounded,
                  text: "LinkedIn",
                  fontSize: cardFontSize,
                  iconSize: iconSize,
                  smallIconSize: smallIconSize,
                  onPressed: () async {
                    final Uri url = Uri.parse('https://www.linkedin.com/in/kartikeysharma03/');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),

                _buildContactCard(
                  context: context,
                  icon: Icons.link_rounded,
                  text: "Twitter",
                  fontSize: cardFontSize,
                  iconSize: iconSize,
                  smallIconSize: smallIconSize,
                  onPressed: () async {
                    final Uri url = Uri.parse('https://x.com/kartikey_sh03');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),

                _buildContactCard(
                  context: context,
                  icon: Icons.link_rounded,
                  text: "Instagram",
                  fontSize: cardFontSize,
                  iconSize: iconSize,
                  smallIconSize: smallIconSize,
                  onPressed: () async {
                    final Uri url = Uri.parse('https://www.instagram.com/kartikeysharma03/');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required BuildContext context,
    required IconData icon,
    required String text,
    required double fontSize,
    required double iconSize,
    required double smallIconSize,
    required Function() onPressed,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.01),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Card(
          color: Colors.white,
          elevation: 4,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.02,
              horizontal: screenWidth * 0.03,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: iconSize,
                  color: Colors.teal.shade900,
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Text(
                    text,
                    style: GoogleFonts.anton(
                      color: Colors.teal.shade900,
                      fontSize: fontSize,
                    ),
                  ),
                ),
                Icon(
                  Icons.open_in_new,
                  size: smallIconSize,
                  color: Colors.teal.shade900,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}