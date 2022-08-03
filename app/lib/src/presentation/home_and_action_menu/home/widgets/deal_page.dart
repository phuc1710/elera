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
    final textTheme = Theme.of(context).textTheme;

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
                    '$subtitle',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ),
                subtitle: Text(
                  '$title',
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
                trailing: Text(
                  '$deal',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Text(
                  '$description',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
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
