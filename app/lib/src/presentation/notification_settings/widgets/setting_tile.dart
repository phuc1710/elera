import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatefulWidget {
  const SettingTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  final String title;
  final bool value;
  final Function(bool) onChange;

  @override
  State<SettingTile> createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: CupertinoSwitch(
        activeColor: Theme.of(context).primaryColor,
        value: value,
        onChanged: (val) {
          setState(() {
            value = val;
          });
          widget.onChange.call(val);
        },
      ),
    );
  }
}
