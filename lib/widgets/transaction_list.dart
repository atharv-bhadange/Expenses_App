import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'No transactions to display',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    //to give spacing between the two
                    height: 10,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.8,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      //fit: BoxFit.cover, //default
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            //column with default scroll view
            //parent should have fixed size
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                shadowColor: Theme.of(context).primaryColorLight,
                margin: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 35,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
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
                  trailing: MediaQuery.of(context).size.width > 500
                      ? TextButton.icon(
                          onPressed: () => deleteTx(transactions[index].id),
                          icon: const Icon(Icons.delete),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                              Theme.of(context).errorColor,
                            ),
                          ),
                          label: const Text(
                            'Delete',
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => deleteTx(transactions[index].id),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
