import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No transactions to display',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  //to give spacing between the two
                  height: 10,
                ),
                Container(
                  height: 400,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    //fit: BoxFit.cover, //default
                  ),
                )
              ],
            )
          : ListView.builder(
              //column with default scroll view
              //parent should have fixed size
              itemBuilder: (ctx, index) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Card(
                    //each transaction card
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Text(
                            '₹${transactions[index].amount}', //'₹ ' + tx.amount.toString(), $ sign used as %d //called string interpolation
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              DateFormat.MMMMEEEEd()
                                  .format(transactions[index].date),
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    elevation: 4,
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
