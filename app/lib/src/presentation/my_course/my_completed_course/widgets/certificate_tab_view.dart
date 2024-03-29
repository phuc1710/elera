import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'bottom_action_ink.dart';

class CertificateTabView extends StatelessWidget {
  const CertificateTabView({
    Key? key,
    this.certificateLink,
  }) : super(key: key);

  final String? certificateLink;

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
              child: SfPdfViewer.network(
                '$certificateLink',
                enableDoubleTapZooming: false,
                enableTextSelection: false,
                scrollDirection: PdfScrollDirection.horizontal,
              ),
            ),
          ),
          BottomActionInk(
            buttonString: AppLocalizations.of(context).downloadCertificate,
            action: () {},
          )
        ],
      ),
    );
  }
}
