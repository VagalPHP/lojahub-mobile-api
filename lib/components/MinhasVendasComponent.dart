import 'package:flutter/material.dart';

class MinhasVendasComponent extends StatelessWidget {
  const MinhasVendasComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 89,
      width: 338,
      child: Card(
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.monetization_on_outlined,
              size: 40,
              color: Color.fromRGBO(16, 48, 79, 1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "MINHAS",
                style: TextStyle(
                  color: Color.fromRGBO(239, 156, 0, 1),
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "VENDAS",
              style: TextStyle(
                color: Color.fromRGBO(16, 48, 79, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
