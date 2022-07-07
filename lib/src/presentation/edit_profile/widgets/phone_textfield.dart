import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../../data/models/edit_profile/country_model.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    Key? key,
    required this.controller,
    required this.countries,
  }) : super(key: key);

  final TextEditingController controller;
  final List<CountryModel?>? countries;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  CountryModel? selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.countries?.firstOrNull;

    widget.controller.text = formatAsPhoneNumber(widget.controller.text) ?? '';
  }

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
          prefixIcon: DropdownButton<CountryModel?>(
            hint: Image.network(
              selectedCountry?.flag ?? '',
              width: 20,
              height: 20,
            ),
            items: widget.countries
                ?.map(
                  (e) => DropdownMenuItem<CountryModel?>(
                    value: e,
                    child: Image.network(e?.flag ?? '', width: 20, height: 20),
                  ),
                )
                .toList(),
            onChanged: updateNewPhonePrefix,
          ),
        ),
      ),
    );
  }

  void updateNewPhonePrefix(CountryModel? newCountry) {
    widget.controller.text = widget.controller.text
        .replaceAll(selectedCountry?.phonePrefix ?? '', '');

    setState(() {
      selectedCountry = newCountry;
    });

    widget.controller.text =
        (selectedCountry?.phonePrefix ?? '') + widget.controller.text;
  }

  TextStyle? inputStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .displayLarge
        ?.copyWith(fontWeight: FontWeight.bold);
  }
}
