import 'package:flutter/material.dart';

class DealPage extends StatelessWidget {
  const DealPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '40% OFF',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                subtitle: Text(
                  "Today's Special",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Text(
                  '40%',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Text(
                  'Get a discount for every course order!\nOnly valid for today!',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
