import 'package:flutter/material.dart';
import 'package:izy_shop/app/core/consts/img.dart';

import '../../../store/presentation/widgets/store_tile.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          StoreTile(shopImg: STORE_1, shopName: 'Maputo Fresh Market'),
          SizedBox(height: 20.0),
          StoreTile(shopImg: STORE_2, shopName: 'Shoprite Matola'),
          SizedBox(height: 20.0),
          StoreTile(shopImg: STORE_3, shopName: 'Premier VIP SPAR'),
          SizedBox(height: 70.0)
        ],
      ),
    );
  }
}
