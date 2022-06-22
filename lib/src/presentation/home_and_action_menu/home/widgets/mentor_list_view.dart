import 'package:flutter/material.dart';

class MentorListview extends StatelessWidget {
  const MentorListview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, index) => InkWell(
            borderRadius: BorderRadius.circular(30.0),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.08,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Mentor $index',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
