import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdf extends StatefulWidget {
  const Pdf({Key? key}) : super(key: key);

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  late PdfViewerController _pdfViewerController;
  bool nowFalse = false;

  @override
  void initState() {
    // TODO: implement initState
    _pdfViewerController = PdfViewerController();
    myFun();
    super.initState();
  }

  Future<void> myFun() async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        nowFalse = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: nowFalse
          ? SfPdfViewer.asset(
              'assets/m2m.pdf',
              initialZoomLevel: 1,
              scrollDirection: PdfScrollDirection.vertical,
              controller: _pdfViewerController,
            )
          : Image.asset('assets/loading.gif'),
    );
  }
}
