import 'package:flutter/material.dart';
import 'package:ticketing_app/payment_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget tiketCard(String title, String type, int price) {
    return Container(
      height: 130,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 5),
          Text(type,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Rp ${NumberFormat('#,###', 'id_ID').format(price)}",
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: Colors.blue)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Payment(
                        title: title,
                        type: type,
                        price: price,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_cart_checkout,
                          color: Colors.white, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        "Beli",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Ticketing App",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            tiketCard("Tiket untuk Dewasa", "Reguler", 300000),
            tiketCard("Tiket untuk Dewasa", "VIP", 450000),
            tiketCard("Tiket untuk Anak", "Reguler", 150000),
            tiketCard("Tiket untuk Anak", "VIP", 250000),
          ],
        ),
      ),
    );
  }
}
