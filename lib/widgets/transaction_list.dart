import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 475,
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
                return Card(
                  elevation: 5,
                  shadowColor: Theme.of(context).primaryColorLight,
                  margin: EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 35,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text('₹${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.MMMEd().format(transactions[index].date),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteTx(transactions[index].id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
