import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

// ignore: must_be_immutable
class DetailSurah extends StatefulWidget {
  var surahNum;
  DetailSurah(this.surahNum, {super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    final surahName = quran.getSurahName(widget.surahNum);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                surahName,
                style: GoogleFonts.amiriQuran(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemCount: quran.getVerseCount(widget.surahNum),
            itemBuilder: (context, index) {
              final verseArabic = quran.getVerse(
                widget.surahNum,
                index + 1,
                verseEndSymbol: true,
              );

              final verseTranslation = quran.getVerseTranslation(
                widget.surahNum,
                index + 1,
                translation: quran.Translation.urdu,
              );

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        verseArabic,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.amiri(
                          fontSize: 24,
                          color: Color.fromARGB(255, 0, 77, 107),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        verseTranslation,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.tradeWinds(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
