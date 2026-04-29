import 'package:flutter/material.dart';

class LetterKeyboard extends StatelessWidget {
  final List<String> letters;
  final List<bool> usedLetters;
  final Function(int) onLetterTap;

  const LetterKeyboard({
    super.key,
    required this.letters,
    required this.usedLetters,
    required this.onLetterTap,
  });

  Widget _buildLetterTile(int index, bool isUsed) {
    return Container(
      width: 50,
      height: 54,
      decoration: BoxDecoration(
        color: isUsed ? const Color(0xFF1E3A50) : const Color(0xFF0A3A5C),
        borderRadius: BorderRadius.circular(8),
        boxShadow: isUsed
            ? []
            : const [
                BoxShadow(
                  color: Color(0xFF072B45),
                  blurRadius: 0,
                  offset: Offset(0, 3),
                ),
              ],
      ),
      child: Center(
        child: Text(
          letters[index],
          style: TextStyle(
            fontSize: 28,
            height: 1,
            fontWeight: FontWeight.w800,
            color: isUsed ? Colors.white.withValues(alpha: 0.25) : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: List.generate(letters.length, (index) {
        final bool isUsed = usedLetters[index];
        if (isUsed) {
          return _buildLetterTile(index, true);
        }

        return Draggable<int>(
          data: index,
          feedback: Material(
            color: Colors.transparent,
            child: _buildLetterTile(index, false),
          ),
          childWhenDragging: _buildLetterTile(index, true),
          child: GestureDetector(
            onTap: () => onLetterTap(index),
            child: _buildLetterTile(index, false),
          ),
        );
      }),
    );
  }
}
