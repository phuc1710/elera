import 'package:flutter/material.dart';

class DealPage extends StatelessWidget {
  const DealPage({
    Key? key,
    this.title,
    this.subtitle,
    this.description,
    this.deal,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? description;
  final String? deal;

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
                    subtitle ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                subtitle: Text(
                  title ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Text(
                  deal ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Text(
                  description ?? '',
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
