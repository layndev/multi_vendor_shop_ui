import 'package:flutter/material.dart';
import 'package:izy_shop/app/core/configs/core_config.dart';

class CustomStatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getStatusBar(context),
      color: Theme.of(context).primaryColor,
    );
  }
}
