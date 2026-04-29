import 'package:flutter/material.dart';
import '../models/level_data.dart';
import '../widgets/top_bar.dart';
import '../widgets/image_card.dart';
import '../widgets/answer_slots.dart';
import '../widgets/letter_keyboard.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currentLevelIndex = 0;
  int coins = 1000;
  late List<String?> filledLetters;
  late List<bool> usedLetters;
  late List<String> shuffledLetters;

  // O'yin faqat 5 ta leveldan iborat.
  final List<LevelData> levels = allLevels.take(5).toList();
  LevelData get currentLevel => levels[currentLevelIndex];

  @override
  void initState() {
    super.initState();
    _initLevel();
  }

  void _initLevel() {
    filledLetters = List.filled(currentLevel.mergedWord.length, null);
    shuffledLetters = List<String>.from(currentLevel.letters)..shuffle();
    usedLetters = List.filled(shuffledLetters.length, false);
  }

  void _onLetterTap(int letterIndex) {
    final int emptySlot = filledLetters.indexOf(null);
    if (emptySlot == -1) return;
    if (usedLetters[letterIndex]) return;

    // Birinchi bo'sh joyga harfni qo'yamiz.
    setState(() {
      filledLetters[emptySlot] = shuffledLetters[letterIndex];
      usedLetters[letterIndex] = true;
    });

    if (!filledLetters.contains(null)) {
      _checkAnswer();
    }
  }

  void _onSlotTap(int slotIndex) {
    if (filledLetters[slotIndex] == null) return;

    final String removedLetter = filledLetters[slotIndex]!;
    int originalIndex = usedLetters.indexOf(true);

    // Qaysi indexdagi harf ishlatilganini topib, qayta ochamiz.
    for (int i = 0; i < shuffledLetters.length; i++) {
      if (shuffledLetters[i] == removedLetter && usedLetters[i]) {
        originalIndex = i;
        break;
      }
    }

    setState(() {
      filledLetters[slotIndex] = null;
      if (originalIndex != -1) {
        usedLetters[originalIndex] = false;
      }
    });
  }

  void _onLetterDropped(int letterIndex, int slotIndex) {
    if (usedLetters[letterIndex]) return;
    if (filledLetters[slotIndex] != null) return;

    setState(() {
      filledLetters[slotIndex] = shuffledLetters[letterIndex];
      usedLetters[letterIndex] = true;
    });

    if (!filledLetters.contains(null)) {
      _checkAnswer();
    }
  }

  void _checkAnswer() {
    final String userAnswer = filledLetters.join();
    if (userAnswer == currentLevel.mergedWord) {
      setState(() {
        coins += 1000;
      });
      Future.delayed(const Duration(milliseconds: 500), _goToNextLevel);
    } else {
      setState(_initLevel);
    }
  }

  void _goToNextLevel() {
    if (currentLevelIndex < levels.length - 1) {
      setState(() {
        currentLevelIndex++;
        _initLevel();
      });
    } else {
      _showWinSnackBar();
      setState(() {
        currentLevelIndex = 0;
        _initLevel();
      });
    }
  }

  void _showWinSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('WIN'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget _buildHintBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFF00507F),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          currentLevel.hint,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            height: 1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  List<Color> _getSlotColors() {
    final int firstPartLength = currentLevel.firstWord.length;
    final List<Color> colors = [];
    for (int i = 0; i < currentLevel.mergedWord.length; i++) {
      if (i < firstPartLength) {
        colors.add(currentLevel.color1);
      } else {
        colors.add(currentLevel.color2);
      }
    }
    return colors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Column(
          children: [
            TopBar(level: currentLevel.levelNumber, coins: coins),
            const SizedBox(height: 4),
            Expanded(
              flex: 11,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: ImageCard(
                        emoji: currentLevel.emoji1,
                        word: currentLevel.firstWord,
                        bottomColor: currentLevel.color1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ImageCard(
                        emoji: currentLevel.emoji2,
                        word: currentLevel.secondWord,
                        bottomColor: currentLevel.color2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            _buildHintBox(),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF00507F),
                borderRadius: BorderRadius.circular(7),
              ),
              child: AnswerSlots(
                answer: currentLevel.mergedWord,
                filledLetters: filledLetters,
                onSlotTap: _onSlotTap,
                onLetterDropped: _onLetterDropped,
                slotColors: _getSlotColors(),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: LetterKeyboard(
                letters: shuffledLetters,
                usedLetters: usedLetters,
                onLetterTap: _onLetterTap,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
