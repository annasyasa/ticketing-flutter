import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'struck_page.dart';
import 'package:intl/intl.dart';

class Payment extends StatefulWidget {
  final String title;   
  final String type;    
  final int price;      

  const Payment({
    super.key,
    required this.title,
    required this.type,
    required this.price,
  });

  @override
  State<Payment> createState() => _PaymentState();
}


class _PaymentState extends State<Payment> {
  // Cash
  void _showCostumDialogCash(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dialogHeader("Pembayaran Tunai", context),
              const SizedBox(height: 20),
              _dialogImage("assets/images/payment-cash.png"),
              const SizedBox(height: 40),
              _dialogText("Pembayaran Tunai"),
              const SizedBox(height: 10),
              _dialogDesc(),
              const SizedBox(height: 20),
              _confirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Credit
  void _showCostumDialogCredit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dialogHeader("Pembayaran Kredit", context),
              const SizedBox(height: 20),
              _dialogImage("assets/images/payment-credit.png"),
              const SizedBox(height: 40),
              _dialogText("Pembayaran Kredit"),
              const SizedBox(height: 10),
              _dialogDesc(),
              const SizedBox(height: 20),
              _confirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Qris
  void _showCostumDialogQris(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _dialogHeader("Pembayaran QRIS / QR", context),
              const SizedBox(height: 20),
              _dialogImage("assets/images/payment-qris.png"),
              const SizedBox(height: 40),
              _dialogText("Pembayaran QRIS / QR"),
              const SizedBox(height: 10),
              _dialogDesc(),
              const SizedBox(height: 20),
              _confirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _goToStruk() {
  // Tutup dialog
  Navigator.pop(context);

  // Arahkan ke halaman Struk
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => StrukPembayaranPage(
        title: widget.title,
        type: widget.type,
        price: widget.price,
      ),
    ),
  );
}


  // header 
  Widget _dialogHeader(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue[700])),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close, color: Colors.grey[600]),
        ),
      ],
    );
  }

  //  image 
  Widget _dialogImage(String asset) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: Image.asset(asset, height: 150, width: 150, fit: BoxFit.cover),
    );
  }

  // text
  Widget _dialogText(String text) {
    return Text(text,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold, fontSize: 20));
  }

  // desc
  Widget _dialogDesc() {
    return Text(
      "Jika pembayaran telah diterima, klik button konfirmasi pembayaran untuk menyelesaikan transaksi",
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.grey[600]),
    );
  }

  // confirm button
  Widget _confirmButton() {
    return GestureDetector(
      onTap: _goToStruk, // fungsi navigasi ke struk
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue[700],
        ),
        child: Text(
          "Konfirmasi Pembayaran",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Ticketing App",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 20)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/images/icons/uang.png")),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Tagihan",
                              style: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 12)),
                          const SizedBox(height: 5),
                          Text(
                            "Rp ${NumberFormat('#,###', 'id_ID').format(widget.price)}",
                            style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Nama Pesanan",
                          style:
                          GoogleFonts.poppins(color: Colors.grey[600])),
                      Text("${widget.title} - ${widget.type}",
                          style: GoogleFonts.poppins(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tanggal",
                          style:
                              GoogleFonts.poppins(color: Colors.grey[600])),
                      Text("18 September 2025", // bisa dinamis juga
                          style: GoogleFonts.poppins(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            Text("Pilih Metode Pembayaran",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[600])),
            const SizedBox(height: 15),

            // Cash
            _paymentMethod("Tunai (Cash)", "assets/images/icons/tunai.png", () {
              _showCostumDialogCash(context);
            }),

            // Kredit
            _paymentMethod("Kartu Kredit", "assets/images/icons/card.png", () {
              _showCostumDialogCredit(context);
            }),

            // QRIS
            _paymentMethod("QRIS / QR Pay", "assets/images/icons/qris.png", () {
              _showCostumDialogQris(context);
            }),

            const SizedBox(height: 15),
            Text("Punya Pertanyaan?",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey[600])),
            const SizedBox(height: 15),
            _helpBox(),
          ],
        ),
      ),
    );
  }

  Widget _paymentMethod(String title, String asset, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(asset, width: 30, height: 30),
                const SizedBox(width: 10),
                Text(title,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
              ],
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _helpBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/images/tanya.png", width: 30, height: 30),
              const SizedBox(width: 10),
              Text(
                "Hubungi Admin untuk bantuan pembayaran.",
                style:GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }
}
