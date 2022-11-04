import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues selectedRange = const RangeValues(20, 64);
  RangeLabels selectedRangeLabel = const RangeLabels('20', '64');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
      ),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          valueIndicatorTextStyle:
              Theme.of(context).textTheme.caption?.copyWith(
                    color: Colors.white,
                  ),
          valueIndicatorColor: Theme.of(context).primaryColor,
          thumbColor: Colors.white,
          overlayColor: Theme.of(context).primaryColor,
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 10,
          ),
          rangeThumbShape: const RoundRangeSliderThumbShape(
            enabledThumbRadius: 5,
            elevation: 2,
          ),
        ),
        child: RangeSlider(
          values: selectedRange,
          labels: RangeLabels(
            r'$' '${selectedRange.start.round()}',
            r'$' '${selectedRange.end.round()}',
          ),
          divisions: 100,
          max: 100,
          onChanged: (RangeValues rv) {
            setState(() {
              selectedRange = rv;
            });
          },
        ),
      ),
    );
  }
}
