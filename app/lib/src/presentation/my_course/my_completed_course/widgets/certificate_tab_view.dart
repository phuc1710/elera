import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'bottom_action_ink.dart';

class CertificateTabView extends StatelessWidget {
  const CertificateTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: const Color(0xff35383f),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 24,
            width: MediaQuery.of(context).size.width - 48,
            child: SizedBox(
              height: screenHeight * 0.62,
              child: SfPdfViewer.asset(
                'assets/mockups/certificate.pdf',
                enableDoubleTapZooming: false,
                enableTextSelection: false,
                scrollDirection: PdfScrollDirection.horizontal,
              ),
            ),
          ),
          BottomActionInk(
            buttonString: 'Download Certificate',
            action: () {},
          )
        ],
      ),
    );
  }
}
