
import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF027C56);
Color secondaryColor = const Color(0xFF1EAB70);
Color whiteColor = const Color(0xFFFFFFFF);
Color fillColor = const Color(0xFFF3F3F3);
Color borderColor = const Color(0xFFD9D9D9);

ButtonStyle buttonstyle(Color bg, Color fg, double radius ) {
  return ElevatedButton.styleFrom(
    backgroundColor: bg,
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
    foregroundColor: fg,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
  );
}


InputDecoration inputStyle(
  IconData icon,
  String hint,

) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    prefixIcon: Icon(icon,size: 20,color: primaryColor,),
    hintText: hint,
    hintStyle: TextStyle(color: primaryColor),
    fillColor: fillColor,
    filled: true,
    // suffixIcon:
    //     IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: borderColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: primaryColor,
      ),
    ),
  );
}

// Search container
Decoration searchDecoration(Color color, Color borderColor) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: borderColor));
}

InputDecoration searchStyle(
    String hint, Color hintColor, Color fillColor, IconData icon) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: hintColor, fontWeight: FontWeight.normal),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    suffixIcon: IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        color: hintColor,
      ),
    ),
    border: InputBorder.none,
    fillColor: fillColor,
    focusColor: borderColor,
  );
}
