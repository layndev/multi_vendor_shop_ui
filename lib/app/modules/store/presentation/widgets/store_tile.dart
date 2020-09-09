import 'package:flutter/material.dart';

import '../../../../core/configs/core_config.dart';
import '../../../../core/consts/img.dart';

class StoreTile extends StatelessWidget {
  final String address;
  final String shopImg;
  final String shopName;
  final String addressImg;
  final String addressDesc;
  StoreTile(
      {Key key,
      this.shopImg,
      this.address = 'Matola',
      this.shopName = 'shop name here!',
      this.addressImg = DELIVER_IMG,
      this.addressDesc = 'address description here!'})
      : super(key: key);

  final Container _promotionTile = Container(
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
    decoration: BoxDecoration(
      color: Colors.black38,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Text(
      'Promoção'.toUpperCase(),
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );

  Widget _builShopName() => Text(
        shopName,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      );
  Widget _address() => RichText(
        overflow: TextOverflow.visible,
        text: TextSpan(children: [
          TextSpan(
              text: addressDesc,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              )),
          // TextSpan(text: addressDesc, style: TextStyle(color: Colors.white)),
        ]),
      );

  Widget _buildAddressTile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(image: AssetImage(addressImg))),
        ),
        SizedBox(width: 8.0),
        Text(address,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        SizedBox(width: 15.0),
        _address(),
      ],
    );
  }

  _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _promotionTile,
          SizedBox(height: 10.0),
          _builShopName(),
          SizedBox(height: 10.0),
          _buildAddressTile(),
        ],
      ),
    );
  }

  Widget _buildContentContainer(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: () {},
      child: Container(
        height: 345,
        width: getWidth(context),
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(12.0),
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(shopImg))),
        child: _buildContent(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContentContainer(context);
  }
}
