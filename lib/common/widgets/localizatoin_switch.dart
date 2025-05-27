import 'package:eventlly/common/app_assets.dart';
import 'package:flutter/material.dart';

class LocalizatoinSwitch extends StatefulWidget {
  const LocalizatoinSwitch({super.key});

  @override
  State<LocalizatoinSwitch> createState() => _LocalizatoinSwitchState();
}

class _LocalizatoinSwitchState extends State<LocalizatoinSwitch> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      onChanged: (value) {
        _value = value;
        setState(() {});
      },
      activeThumbImage: AssetImage(AppAssets.EGLogo),
      inactiveThumbImage: AssetImage(AppAssets.LRLogo),
    );
  }
}
