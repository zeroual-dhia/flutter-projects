import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textinput extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String hint_text, label;

  final bool password;
  // ignore: non_constant_identifier_names
  const Textinput(
      {super.key,
      // ignore: non_constant_identifier_names
      this.hint_text = "",
      this.label = "",
      this.password = false});

  @override
  State<Textinput> createState() => _TextinputState();
}

class _TextinputState extends State<Textinput> {
  bool isObscured = true;
  double opacity = 0.5;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.manrope(
              color: Colors.white.withOpacity(0.5),
              letterSpacing: 0.5,
              fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            cursorColor: Colors.white.withOpacity(0.5),
            obscuringCharacter: '*',
            obscureText: widget.password ? isObscured : false,
            style: TextStyle(color: Colors.white.withOpacity(0.5)),
            decoration: InputDecoration(
              suffixIcon: widget.password
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscured = !isObscured;
                          opacity = isObscured ? 0.5 : 1; // Update opacity
                        });
                      },
                      icon: Icon(
                        Icons.visibility,
                        color: const Color(0xffE57734).withOpacity(opacity),
                      ),
                    )
                  : null,
              suffixIconColor: const Color(0xffE57734).withOpacity(opacity),
              hintText: widget.hint_text,
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.3),
                  fontSize: 15,
                  letterSpacing: 0.5),
              filled: true, // Enables background color
              fillColor: const Color(0xff313336), // Custom background color
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 17), // Custom padding
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17), // Custom border radius
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 1.5, // Border width
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17), // Custom border radius
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 1.5, // Border width
                ),
              ),
            ))
      ],
    );
  }
}
