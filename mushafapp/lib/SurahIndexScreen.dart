import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mushafapp/DetailSurah.dart';
import 'package:quran/quran.dart' as quran;

class SurahIndexScreen extends StatefulWidget {
  const SurahIndexScreen({super.key});

  @override
  State<SurahIndexScreen> createState() => _SurahIndexScreenState();
}

class _SurahIndexScreenState extends State<SurahIndexScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<int> _filteredSurahIndices = List.generate(114, (index) => index + 1);
  bool _isSearchFocused = false;

  void _filterSurahs(String query) {
    final filtered =
        List.generate(114, (index) => index + 1)
            .where(
              (i) =>
                  quran
                      .getSurahName(i)
                      .toLowerCase()
                      .contains(query.toLowerCase()) ||
                  quran
                      .getSurahNameEnglish(i)
                      .toLowerCase()
                      .contains(query.toLowerCase()) ||
                  quran.getSurahNameArabic(i).contains(query),
            )
            .toList();

    setState(() {
      _filteredSurahIndices = filtered;
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isSearchFocused = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 120,
          decoration: BoxDecoration(
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
                "Mashallah Read مصحف App",
                style: GoogleFonts.amiriQuran(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(_isSearchFocused ? 35 : 25),
                boxShadow:
                    _isSearchFocused
                        ? [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ]
                        : [],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterSurahs,
                decoration: InputDecoration(
                  hintText: 'Search Surah...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredSurahIndices.length,
              itemBuilder: (context, index) {
                final surahNumber = _filteredSurahIndices[index];

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailSurah(surahNumber),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(44, 146, 143, 143),
                      radius: 25,
                      child: Text(
                        "$surahNumber",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 77, 107),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      quran.getSurahNameArabic(surahNumber),
                      style: GoogleFonts.amiriQuran(fontSize: 22),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text(
                          "${quran.getSurahName(surahNumber)} - ${quran.getSurahNameEnglish(surahNumber)}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Color.fromARGB(44, 3, 184, 255),
                      radius: 25,
                      child: Image.asset(
                        quran.getPlaceOfRevelation(surahNumber) == "Makkah"
                            ? "assets/Makkah.png"
                            : "assets/Madina.png",
                        width: 50,
                        height: 38,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
