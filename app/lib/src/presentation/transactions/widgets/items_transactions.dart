import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/router/app_router.dart';
import 'transactions_course_image.dart';

class ItemsTransactionsTab extends StatelessWidget {
  const ItemsTransactionsTab({
    Key? key,
    required this.courseImage,
    required this.courseName,
    required this.status,
  }) : super(key: key);
  final String courseImage;
  final String courseName;
  final String status;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TransactionsCourseImage(
                    imagePath: courseImage,
                  ),
                  SizedBox(
                    width: screenWidth * 0.25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 40.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            status,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          context.router.push(const EReceiptRoute());
                        },
                        child: const Text(
                          'E-receipt',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
