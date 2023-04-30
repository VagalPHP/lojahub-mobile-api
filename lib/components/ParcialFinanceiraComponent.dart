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
              "Parcial Financeira",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(255, 255, 255, 0.8),
              ),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundColor: Color.fromRGBO(16, 48, 79, 1),
          radius: 35,
          child: Icon(
            Icons.supervised_user_circle,
            color: Colors.white,
            size: 50,
          ),
        ),
      ],
    );
  }
}
