import 'package:flutter/material.dart';

class LevelData {
  final int levelNumber;
  final String firstWord;
  final String secondWord;
  final String mergedWord;
  final String emoji1;
  final String emoji2;
  final List<String> letters;
  final String hint;
  final Color color1;
  final Color color2;

  const LevelData({
    required this.levelNumber,
    required this.firstWord,
    required this.secondWord,
    required this.mergedWord,
    required this.emoji1,
    required this.emoji2,
    required this.letters,
    required this.hint,
    required this.color1,
    required this.color2,
  });
}

final List<LevelData> allLevels = [
  LevelData(
    levelNumber: 1,
    firstWord: 'BOOK',
    secondWord: 'KING',
    mergedWord: 'BOOKING',
    emoji1: '📖',
    emoji2: '👑',
    letters: ['B', 'O', 'O', 'K', 'I', 'N', 'G', 'A', 'E'],
    hint: 'Mehmonxona yoki chipta band qilish jarayoni',
    color1: Color(0xFF81D4FA),
    color2: Color(0xFFFFCC80),
  ),
  LevelData(
    levelNumber: 2,
    firstWord: 'RAIN',
    secondWord: 'BOW',
    mergedWord: 'RAINBOW',
    emoji1: '🌧️',
    emoji2: '🏹',
    letters: ['R', 'A', 'I', 'N', 'B', 'O', 'W', 'L', 'T'],
    hint: 'Yomgirdan keyin osmonda ko\'rinadigan rangli yoy',
    color1: Color(0xFFB39DDB),
    color2: Color(0xFFFFAB91),
  ),
  LevelData(
    levelNumber: 3,
    firstWord: 'SUN',
    secondWord: 'FLOWER',
    mergedWord: 'SUNFLOWER',
    emoji1: '☀️',
    emoji2: '🌼',
    letters: ['S', 'U', 'N', 'F', 'L', 'O', 'W', 'E', 'R', 'A', 'T'],
    hint: 'Quyosh tomonga qarab o\'sadigan sariq gul',
    color1: Color(0xFFFFE082),
    color2: Color(0xFFA5D6A7),
  ),
  LevelData(
    levelNumber: 4,
    firstWord: 'FOOT',
    secondWord: 'BALL',
    mergedWord: 'FOOTBALL',
    emoji1: '🦶',
    emoji2: '⚽',
    letters: ['F', 'O', 'O', 'T', 'B', 'A', 'L', 'L', 'N', 'R'],
    hint: 'Dunyodagi eng mashhur jamoaviy sport turi',
    color1: Color(0xFF80CBC4),
    color2: Color(0xFF90CAF9),
  ),
  LevelData(
    levelNumber: 5,
    firstWord: 'STAR',
    secondWord: 'FISH',
    mergedWord: 'STARFISH',
    emoji1: '⭐',
    emoji2: '🐟',
    letters: ['S', 'T', 'A', 'R', 'F', 'I', 'S', 'H', 'E', 'O'],
    hint: 'Dengizda yashaydigan yulduzsimon jonzot',
    color1: Color(0xFFFFAB91),
    color2: Color(0xFFCE93D8),
  ),
];
