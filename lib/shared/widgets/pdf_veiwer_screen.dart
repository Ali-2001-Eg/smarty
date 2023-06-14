import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final String pdfPath;
  final String title;
  const PdfViewerScreen({Key? key, required this.pdfPath, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: const Color(0xff090A4A),
      ),
      body: SfPdfViewer.network(pdfPath),
    );
  }
}
