import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mushafapp/AlAsmaUlHusna.dart';
import 'package:mushafapp/AudioSurahScreen.dart';
import 'package:mushafapp/SurahIndexScreen.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:intl/intl.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  // List of cards to display in the swiper
  List<Widget> cards = [];

  @override
  void initState() {
    super.initState();
    // Initialize cards list in initState
    cards = [
      GestureDetector(
        onTap: () {
          // Navigate to AlAsmaUlHusna screen when tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AlAsmaUlHusna()),
          );
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg1.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Names of Allah | Al Asma Ul Husna',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          // Navigate to SurahIndexScreen when tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SurahIndexScreen()),
          );
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg4.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Read Quran | Mushafa',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          // Navigate to AudioSurahScreen when tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AudiosurahScreen()),
          );
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg2.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Recitation | Alafasy',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ];
  }

  var time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 120,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 89, 131, 171),
                Color.fromARGB(255, 0, 77, 107),
                Color.fromARGB(255, 57, 94, 123),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,

            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Swipe The Card For More Options | ${DateFormat("jms").format(time)}",
                  style: GoogleFonts.anton(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CardSwiper widget added here
              Flexible(
                child: CardSwiper(
                  cardsCount: cards.length,
                  cardBuilder: (
                    context,
                    index,
                    percentThresholdX,
                    percentThresholdY,
                  ) {
                    return cards[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
