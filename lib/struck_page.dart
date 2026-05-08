import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StrukPembayaranPage extends StatelessWidget {
  final String title;   
  final String type;    
  final int price;         

  const StrukPembayaranPage({
    Key? key,
    required this.title,
    required this.type,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Bukti Pembayaran', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue[100], // warna lingkaran
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.blue,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 12),
                Text('Pembayaran Berhasil',
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('Transaksi kamu telah selesai.\nDetail pembelian ada di bawah ini',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(color: Colors.grey[600])),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('$title ($type)', style: GoogleFonts.poppins()),
                          Text('Rp ${NumberFormat('#,###', 'id_ID').format(price)}', style: GoogleFonts.poppins()),
                        ],
                      ),
                const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(type, style: GoogleFonts.poppins(color: Colors.grey[600], fontSize: 12)),
                        ],
                      ),
                const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Pembayaran', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                        Text(
                          'Rp ${NumberFormat('#,###', 'id_ID').format(price)}',
                           style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: Colors.blue)),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // ubah nilai ini
                          ),
                          side: BorderSide(color: Colors.blue),
                        ),
                        child: Text(
                          'Kembali',
                          style: GoogleFonts.poppins(color: Colors.blue),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Fungsi unduh belum dibuat')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Unduh bukti',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
