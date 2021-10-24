import 'package:car/country.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'welcome.dart';
import 'country.dart';
import 'ResultPage.dart';

final cloudinary = CloudinaryPublic('doeq0cvif', 'pdje9ei1', cache: false);
Color myColor = Colors.transparent;
String url1 = 'emptyurl';
String url2 = 'emptyurl';
String url3 = 'emptyurl';
String url4 = 'emptyurl';

String res1 = '';
String res2 = '';
String res3 = '';
String res4 = '';

List Damage = [];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(primaryColor: Color(0xff023e8a)),
      home: Welcome(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03045e),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Car Genesis',
          style: GoogleFonts.montserrat(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  final images =
                      await MultiImagePicker.pickImages(maxImages: 4);

                  List<CloudinaryResponse> uploadedImages =
                      await cloudinary.multiUpload(
                    images
                        .map(
                          (image) => CloudinaryFile.fromFutureByteData(
                            image.getByteData(),
                            identifier: image.identifier,
                          ),
                        )
                        .toList(),
                  );

                  try {
                    url1 = uploadedImages[0].secureUrl;
                    url2 = uploadedImages[1].secureUrl;
                    url3 = uploadedImages[2].secureUrl;
                    url4 = uploadedImages[3].secureUrl;
                  } catch (e) {
                    print(e);
                  }
                  print(url1);
                  print('Image Uploaded');
                  Response response1;
                  Response response2;
                  Response response3;
                  Response response4;
                  var dio = Dio();
                  response1 = await dio.post(
                      'https://car-genesis.herokuapp.com/',
                      data: {'url': url1});
                  print(response1.data);
                  res1 = response1.data;
                  if (res1 != '') {
                    Damage.add(res1);
                  }

                  if (url2 != 'emptyurl') {
                    response2 = await dio.post(
                        'https://car-genesis.herokuapp.com/',
                        data: {'url': url2});
                    print(response2.data);
                    res2 = response2.data;
                    if (res2 != '') {
                      Damage.add(res2);
                    }
                  }
                  if (url3 != 'emptyurl') {
                    response3 = await dio.post(
                        'https://car-genesis.herokuapp.com/',
                        data: {'url': url3});
                    print(response3.data);
                    res3 = response3.data;
                    if (res3 != '') {
                      Damage.add(res3);
                    }
                  }
                  if (url4 != 'emptyurl') {
                    response4 = await dio.post(
                        'https://car-genesis.herokuapp.com/',
                        data: {'url': url4});
                    print(response4.data);
                    res4 = response4.data;
                    if (res4 != '') {
                      Damage.add(res4);
                    }
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Result()),
                  );
                  isLoading = false;
                  setState(() {});
                },
                child: Container(
                  child: Text(
                    'Select Pictures',
                    style: GoogleFonts.roboto(fontSize: 25),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 23, vertical: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xff023e8a)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CircularProgressIndicator(
                  color: isLoading == false ? Colors.transparent : Colors.blue)
            ],
          ),
        ),
      ),
    );
  }
}

// LoadingScreen(context) {
//   return Scaffold(
//     body: Center(
//       child: CircularProgressIndicator(),
//     ),
//   );
// }
