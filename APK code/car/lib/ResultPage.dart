import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'country.dart';
import 'main.dart';

var pricesAmerican = {
  'Head Lamp': 150,
  'Door Scratch': 80,
  'Glass Shatter': 280,
  'Tail Lamp': 150,
  'Bumper Dent': 200,
  'Door Dent': 200,
  'Bumper Scratch': 120,
  'Labor cost per hour': 50,
};
var pricesIndian = {
  'Head Lamp': 8500,
  'Door Scratch': 1500,
  'Glass Shatter': 7500,
  'Tail Lamp': 8500,
  'Bumper Dent': 5000,
  'Door Dent': 5000,
  'Bumper Scratch': 3000,
  'Labor cost per hour': 1000,
};

String Currency = CountryCode == 0 ? "₹" : "\$";
var DamageSet = Damage.toSet();
var DamageList = DamageSet.toList();

int LabourCharge = CountryCode == 0 ? 1000 : 50;
dynamic totalAmount = LabourCharge * DamageList.length;

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    var prices = CountryCode == 0 ? pricesIndian : pricesAmerican;
    for (int i = 0; i < DamageList.length; i++) {
      totalAmount += prices[DamageList[i]];
    }

    return Scaffold(
      backgroundColor: Color(0xff03045e),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Predicted Expenses',
          style: GoogleFonts.montserrat(fontSize: 30),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Country()),
          );
        },
        backgroundColor: Color(0xff023e8a),
        child: Icon(
          Icons.home,
          color: Color(0xff90e0ef),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 40, 10, 240),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Color(0xff0096c7),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: DamageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: Colors.transparent,
                          child: Center(
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                DamageList[index] +
                                    ':   ' +
                                    Currency +
                                    '${prices[DamageList[index]]}',
                                style: GoogleFonts.roboto(fontSize: 30),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Divider(),
                Container(
                  height: 50,
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  child: Text(
                    'Labour Cost:   ' +
                        Currency +
                        LabourCharge.toString() +
                        '/hr',
                    style: GoogleFonts.roboto(fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  child: Text(
                    'Time Required:   ' + DamageList.length.toString() + ' hrs',
                    style: GoogleFonts.roboto(fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  child: Text(
                    'Total Cost: ' + Currency + totalAmount.toString(),
                    style: GoogleFonts.roboto(fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    DamageList.clear();
  }
}
