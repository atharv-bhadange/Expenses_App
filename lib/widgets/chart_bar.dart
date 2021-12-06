import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final int amt;
  final double spendingPercent;

  // ignore: use_key_in_widget_constructors
  const ChartBar(
      {required this.label, required this.amt, required this.spendingPercent});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, contraints) {
        return Column(
          children: [
            SizedBox(
              height: contraints.maxHeight * 0.125,
              child: FittedBox(
                child: Text(
                    '₹$amt'), //$ sign used as %d //called string interpolation
              ),
            ),
            SizedBox(
              height: contraints.maxHeight * 0.05,
            ),
            SizedBox(
              height: contraints.maxHeight * 0.65,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(220, 220, 220, 1),
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
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: contraints.maxHeight * 0.05,
            ),
            SizedBox(
              height: contraints.maxHeight * 0.125,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
