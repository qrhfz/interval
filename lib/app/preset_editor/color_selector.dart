import 'package:flutter/material.dart';

class ColorSelecor extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final Function(Color) onSelected;

  const ColorSelecor({
    required this.color,
    required this.isSelected,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(color);
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected ? Border.all(width: 2, color: Colors.blue) : null,
        ),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
