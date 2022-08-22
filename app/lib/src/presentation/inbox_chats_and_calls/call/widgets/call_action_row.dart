import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CallActionRow extends StatelessWidget {
  const CallActionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Positioned(
      bottom: 20,
      child: SizedBox(
        width: screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xffff5b73),
              child: Icon(
                IconlyBold.close_square,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: primaryColor,
                child: const Icon(
                  Icons.videocam_off_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xfffc9a0d),
              child: Icon(
                IconlyBold.volume_up,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
