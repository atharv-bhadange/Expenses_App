import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        //returns M for monday, T for Tuesday and so on
        'amount': totalSum,
      };
    }); //.reversed.toList();
  }

  int get totalSpending {
    return groupedTransactionValues.fold(0, (sum, item) {
      return (sum + (item['amount'] as int));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Theme.of(context).primaryColorDark,
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight, //fixed width(in this case) for every child
              child: ChartBar(
                label: (data['day'] as String),
                amt: (data['amount'] as int),
                spendingPercent: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as int) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
