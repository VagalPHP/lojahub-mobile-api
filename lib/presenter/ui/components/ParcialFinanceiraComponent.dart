import 'package:flutter/material.dart';

class ParcialFinanceiraComponent extends StatelessWidget {
  const ParcialFinanceiraComponent({super.key, this.salesAmount});
  final String? salesAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("R\$ $salesAmount",
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            const Text(
              "Parcial Financeira (Mensal)",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(255, 255, 255, 0.8),
              ),
            ),
          ],
        ),
        ClipRRect(
          // Avatar quadrado
          borderRadius: BorderRadius.circular(10.0), //or 15.0
          child: Container(
            height: 47,
            width: 47,
            color: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.supervised_user_circle,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
