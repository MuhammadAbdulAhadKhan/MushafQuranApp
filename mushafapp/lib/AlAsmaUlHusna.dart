import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AlAsmaUlHusna extends StatefulWidget {
  AlAsmaUlHusna({super.key});

  var AlAsmaUlHusnaList = [
    "الرَّحْمَن",
    "الرَّحِيم",
    "الْمَلِك",
    "الْقُدُّوس",
    "السَّلاَم",
    "المُؤْمِن",
    "المُهَيْمِن",
    "الْعَزِيز",
    "الْجَبَّار",
    "المُتَكَبِّر",
    "الخَالِق",
    "البَارِئ",
    "المُصَوِّر",
    "الغَفَّار",
    "القَهَّار",
    "الوَهَّاب",
    "الرَّزَّاق",
    "الْفَتَّاح",
    "العَلِيم",
    "القَابِض",
    "البَاسِط",
    "الخَافِض",
    "الرَّافِع",
    "المُعِزُّ",
    "المُذِلُّ",
    "السَّميِع",
    "البَصِير",
    "الحَكَم",
    "العَدْل",
    "اللَّطِيف",
    "الْخَبِير",
    "الحَلِيم",
    "العَظِيم",
    "الغَفُور",
    "الشَّكُور",
    "العَلِيّ",
    "الكَبِير",
    "الحَفِيظ",
    "المُقيِت",
    "الحَسِيب",
    "الجَلِيل",
    "الكَرِيم",
    "الرَّقِيب",
    "المُجِيب",
    "الواسِع",
    "الحَكِيم",
    "الْوَدُود",
    "المَجِيد",
    "البَاعِث",
    "الشَّهِيد",
    "الْحَق",
    "الْوَكِيل",
    "القَوِي",
    "المَتِين",
    "الْوَلِي",
    "الْحَمِيد",
    "المُحْصِي",
    "المُبْدِئ",
    "المُعِيد",
    "المُحْيِي",
    "المُمِيت",
    "الْحَيِي",
    "الْقَيُّوم",
    "الْوَاجِد",
    "المَاجِد",
    "الواحِد",
    "الأَحَد",
    "الصَّمَد",
    "القَادِر",
    "المُقْتَدِر",
    "المُقَدِّم",
    "المُؤَخِّر",
    "الأوَّل",
    "الآخِر",
    "الظَّاهِر",
    "البَاطِن",
    "الْوَالِي",
    "المُتَعَالِي",
    "البَر",
    "التَّوَاب",
    "المُنْتَقِم",
    "العَفُو",
    "الرَّؤُوف",
    "مَالِكُ ٱلْمُلْك",
    "ذُوالْجَلاَلِ وَالإكْرَام",
    "المُقْسِط",
    "الجَامِع",
    "ٱلْغَني",
    "ٱلمُغْنِي",
    "اَلْمَانِع",
    "ٱلدَّار",
    "النَّافِع",
    "النُّور",
    "ٱلْهَادِي",
    "ٱلْبَادِع",
    "ٱلْبَاقِي",
    "ٱلْوَارِث",
    "الرَّشِيد",
    "ٱلصَّبُور",
  ];

  @override
  State<AlAsmaUlHusna> createState() => _AlAsmaUlHusnaState();
}

class _AlAsmaUlHusnaState extends State<AlAsmaUlHusna> {
  int _selectedIndex = -1;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        _selectedIndex = -1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
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
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "99 Names of Allah | أسماء الله الحسنى",
                style: GoogleFonts.amiriQuran(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.builder(
          padding: const EdgeInsets.all(12.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
            childAspectRatio: 1,
          ),
          itemCount: widget.AlAsmaUlHusnaList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _onTap(index),
              child: AnimatedScale(
                scale: _selectedIndex == index ? 0.92 : 1.0,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: Colors.black45,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("assets/bg1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withOpacity(0.25),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            widget.AlAsmaUlHusnaList[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.amiriQuran(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                const Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 3,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
