import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;

class DetailAudio extends StatefulWidget {
  final int surahNum;

  const DetailAudio(this.surahNum, {super.key});

  @override
  State<DetailAudio> createState() => _DetailAudioState();
}

class _DetailAudioState extends State<DetailAudio> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _setAudio();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _setAudio() async {
    try {
      final audioUrl = quran.getAudioURLBySurah(widget.surahNum);
      await audioPlayer.setUrl(audioUrl);

      audioPlayer.positionStream.listen((position) {
        setState(() {
          this.position = position;
        });
      });

      audioPlayer.durationStream.listen((duration) {
        setState(() {
          this.duration = duration ?? Duration.zero;
        });
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> toggleButton() async {
    setState(() {
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      await audioPlayer.play();
    } else {
      await audioPlayer.pause();
    }
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                quran.getSurahName(widget.surahNum),
                style: GoogleFonts.amiriQuran(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/الشيخ مشاري راشد العفاسي.jpg',
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                quran.getSurahNameArabic(widget.surahNum),
                style: GoogleFonts.cairo(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              const Text("Recitation", style: TextStyle(fontSize: 20)),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble().clamp(
                  0.0,
                  duration.inSeconds.toDouble(),
                ),
                onChanged: (value) async {
                  final newPosition = Duration(seconds: value.toInt());
                  await audioPlayer.seek(newPosition);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_formatTime(position)),
                    Text(_formatTime(duration - position)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Color.fromARGB(255, 0, 77, 107),
                  child: IconButton(
                    icon: Icon(
                      isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill_rounded,
                    ),
                    iconSize: 50,
                    color: Colors.white,
                    onPressed: () async {
                      await toggleButton();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
