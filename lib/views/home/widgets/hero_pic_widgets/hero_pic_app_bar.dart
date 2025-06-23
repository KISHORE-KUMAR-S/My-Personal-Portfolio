import 'package:flutter/material.dart';
import '../../../../portfolio_app.dart';

class HeroPicAppBar extends StatelessWidget {
  const HeroPicAppBar({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(),
        Container(
          color: Color(0xFF010101),
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 50, right: 16),
          child: Text(
            'SOFTWARE ENGINEER',
            textAlign: TextAlign.right,
            style: TextStyle(
              package: PortfolioApp.pkg,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 10.5,
            ),
          ),
        ),
      ],
    );
  }
}
