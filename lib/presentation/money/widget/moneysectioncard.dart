import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Moneysectioncard extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final bool isExpense;

  Moneysectioncard({
    required this.title,
    required this.date,
    required this.amount,
    required this.isExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                date,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          Text(
            "${isExpense ? '- ' : '+ '}৳ $amount",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isExpense ? Colors.redAccent : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}