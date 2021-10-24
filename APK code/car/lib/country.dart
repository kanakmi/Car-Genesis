import 'package:car/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ResultPage.dart';

String CountryName = 'India';
int CountryCode = 0;

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03045e),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Select Country',
          style: GoogleFonts.montserrat(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  CountryName = 'India';
                  CountryCode = 0;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.symmetric(horizontal: 23, vertical: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xff023e8a)),
                  child: Center(
                    child: Text(
                      'India',
                      style: GoogleFonts.roboto(fontSize: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              GestureDetector(
                onTap: () {
                  CountryName = 'USA';
                  CountryCode = 1;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.symmetric(horizontal: 23, vertical: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xff023e8a)),
                  child: Center(
                    child: Text(
                      'USA',
                      style: GoogleFonts.roboto(fontSize: 25),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
