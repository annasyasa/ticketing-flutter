import 'package:flutter/material.dart';
import 'package:ticketing_app/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //container image
            Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.cover,
              ),
             ),
            ),
            //container text
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Text(
                    "Ticketing App",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold, 
                    fontSize: 26),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Membantu Anda untuk management pembelian ticket agar lebih efisien",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  //container button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),);
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )],
        ),
      ),
    );
  }
}