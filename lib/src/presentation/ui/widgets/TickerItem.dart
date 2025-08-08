import 'dart:math';

import 'package:flutter/material.dart';

class TickerItem extends StatelessWidget {
  const TickerItem({required this.ticker, required this.cost, super.key});

  final String ticker;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(Random().nextInt(255),
                          Random().nextInt(255), Random().nextInt(255), 0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  child: Text(
                    ticker,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        fontFamily: 'Roboto'),
                  ),
                )
              ],
            ),
            Text(
              cost,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  fontFamily: 'Roboto'),
            ),
          ],
        ));
  }
}
