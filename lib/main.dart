import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('assets/images/kartikey.png'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Kartikey Sharma',
              style: GoogleFonts.pacifico(
                fontSize: 50.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "FLUTTER DEVELOPER",
              style: GoogleFonts.sourceCodePro(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade100,
                letterSpacing: 3.5,
              ),
            ),
            SizedBox(
              width: 170.0,
              height: 20.0,
              child: Divider(
                color: Colors.teal.shade100,

              ),
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 30.0,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                    "+91 8864997581",
                    style: GoogleFonts.novaRound(
                      color: Colors.teal.shade900,
                      fontSize: 20.0,
                    ),
                  ),
                )),
            SizedBox(
              height: 5.0,
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 30.0,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                    "info.kartik2003@gmail.com",
                    style: GoogleFonts.novaRound(
                      color: Colors.teal.shade900,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
