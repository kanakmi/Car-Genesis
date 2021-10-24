import 'package:car/country.dart';
import 'package:car/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff03045e),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Car Genesis',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 70,
                      color: Color(0xff48cae4)),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Complete Car Solution',
                  style: GoogleFonts.roboto(
                      fontSize: 20, color: Color(0xffade8f4)),
                ),
                SizedBox(
                  height: h / 2.5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Country()),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    child: Icon(Icons.arrow_forward_ios_rounded),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xff023e8a)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
