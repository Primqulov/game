import 'package:flutter/material.dart';

class AnswerSlots extends StatelessWidget {
  final String answer;
  final List<String?> filledLetters;
  final Function(int) onSlotTap;
  final Function(int letterIndex, int slotIndex) onLetterDropped;
  final List<Color> slotColors;

  const AnswerSlots({
    super.key,
    required this.answer,
    required this.filledLetters,
    required this.onSlotTap,
    required this.onLetterDropped,
    required this.slotColors,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 6,
      runSpacing: 6,
      children: List.generate(answer.length, (index) {
        final letter = filledLetters[index];
        final bool isFilled = letter != null;
        final Color color = slotColors[index % slotColors.length];

        return DragTarget<int>(
          onWillAcceptWithDetails: (details) => !isFilled,
          onAcceptWithDetails: (details) => onLetterDropped(details.data, index),
          builder: (context, candidateData, rejectedData) {
            final bool hovering = candidateData.isNotEmpty;
            return GestureDetector(
              onTap: isFilled ? () => onSlotTap(index) : null,
              child: Container(
                width: 42,
                height: 46,
                decoration: BoxDecoration(
                  color: isFilled ? color : color.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: hovering ? Colors.white : color.withValues(alpha: 0.8),
                    width: hovering ? 2.5 : 1.8,
                  ),
                ),
                child: Center(
                  child: Text(
                    letter ?? '',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
