import 'package:cofee/routes.dart';
import 'package:cofee/widgets/textinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Register",
                    style: GoogleFonts.manrope(
                        fontSize: 30,
                        color: const Color(0xffE57734),
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 35,
                ),
                const Textinput(
                    hint_text: "abcd12@gmail.com", label: "Enter your email"),
                const SizedBox(
                  height: 15,
                ),
                const Textinput(
                    hint_text: "full name", label: "Enter your full name"),
                const SizedBox(
                  height: 15,
                ),
                const Textinput(
                  label: "Enter your password",
                  password: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Textinput(
                  label: "Re-Enter your password",
                  password: true,
                ),
                const SizedBox(
                  height: 23,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteGenerator.home);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xffE57734),
                        borderRadius: BorderRadius.circular(17)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Sign up",
                      style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I have an acount ! ",
                      style: GoogleFonts.manrope(
                          color: Colors.white.withOpacity(0.5),
                          letterSpacing: 0.5,
                          fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(RouteGenerator.login);
                      },
                      child: Text(
                        "login",
                        style: GoogleFonts.manrope(
                            color: const Color(0xffE57734),
                            letterSpacing: 0.5,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "or",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                      color: Colors.white.withOpacity(0.5),
                      letterSpacing: 0.5,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                        color: const Color(0xff313336),
                        borderRadius: BorderRadius.circular(17)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 13),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/google.svg',
                            width: 28,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Continue with Google",
                            style: GoogleFonts.manrope(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                        color: const Color(0xff313336),
                        borderRadius: BorderRadius.circular(17)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.apple,
                            color: Color(0xffE57734),
                            size: 34,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Continue with Apple",
                            style: GoogleFonts.manrope(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
