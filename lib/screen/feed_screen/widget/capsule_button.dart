import 'package:flutter/material.dart';
import 'package:orange_ui/utils/color_res.dart';

class CapsuleButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const CapsuleButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF5271FF) : const Color(0xFFDCE2FF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: isSelected ? ColorRes.white : const Color(0xFF5271FF),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TagsCapsuleButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const TagsCapsuleButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _CapsuleButtonState createState() => _CapsuleButtonState();
}

class _CapsuleButtonState extends State<TagsCapsuleButton> {
  bool _isTapped = false;

  void _handleTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: _isTapped ? const Color(0xFF5271FF) : const Color(0xFFDCE2FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: _isTapped ? Colors.white : const Color(0xFF5271FF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
