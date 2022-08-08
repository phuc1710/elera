import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../../data/models/edit_profile/country_model.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    Key? key,
    required this.controller,
    required this.countries,
    this.currentCountry,
    required this.onCountryChange,
  }) : super(key: key);

  final TextEditingController controller;
  final List<CountryModel?>? countries;
  final CountryModel? currentCountry;
  final Function(CountryModel?) onCountryChange;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: widget.controller,
        style: inputStyle(context),
        inputFormatters: [
          PhoneInputFormatter(),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixStyle: inputStyle(context),
          prefixIcon: widget.currentCountry != null
              ? DropdownButton<CountryModel?>(
                  hint: Text(widget.currentCountry?.icon ?? ''),
                  items: widget.countries
                      ?.map(
                        (e) => DropdownMenuItem<CountryModel?>(
                          value: e,
                          child: Text(
                            '${e?.icon} ${e?.dialCode}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: widget.onCountryChange,
                )
              : null,
        ),
      ),
    );
  }

  TextStyle? inputStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .caption
        ?.copyWith(fontWeight: FontWeight.bold);
  }
}
