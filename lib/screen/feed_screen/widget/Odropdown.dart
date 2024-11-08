import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF666D80),
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF5271FF),
          ),
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFFF3F3F3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          value: value,
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(item.toString()),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
