import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final int amt;
  final double spendingPercent;

  ChartBar(
      {required this.label, required this.amt, required this.spendingPercent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
                '₹${amt}'), //$ sign used as %d //called string interpolation
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 220, 220, 1),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                //sized according to fraction of the given value
                heightFactor: spendingPercent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
