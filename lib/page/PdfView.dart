import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfView extends StatelessWidget {
  const PdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        backgroundColor: Colors.grey,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
      ).fromAsset('assets/Tp4-excel.pdf'),
    );
  }
}



class PdfView21 extends StatelessWidget {
  const PdfView21({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        backgroundColor: Colors.grey,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
      ).fromAsset('assets/watani2021.pdf'),
    );
  }
}


class PdfView20 extends StatelessWidget {
  const PdfView20({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        backgroundColor: const Color(0xFF1E88E5),
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
      ).fromAsset('assets/watani2020.pdf'),
    );
  }
}

class PdfView22 extends StatelessWidget {
  const PdfView22({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: false,
        backgroundColor: const Color(0xFF1E88E5),
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
      ).fromAsset('assets/watani2022.pdf'),
    );
  }
}
