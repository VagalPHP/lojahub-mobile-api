import 'package:flutter/material.dart';

class UltimasVendasComponent extends StatelessWidget {
  const UltimasVendasComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Últimas Vendas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(16, 48, 79, 1),
            fontSize: 18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: AspectRatio(
            aspectRatio: 16 / 8,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Image.asset('assets/images/api_logos/1.png'),
                    title: const Text(
                      'Mercado Livre',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("40 transações"),
                    trailing: const Text(
                      "R\$ 89.615,32",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Image.asset('assets/images/api_logos/8.png'),
                    title: const Text(
                      'Shopee',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("15 transações"),
                    trailing: const Text(
                      "R\$ 3.534,80",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Image.asset('assets/images/api_logos/8.png'),
                    title: const Text(
                      'Shopee',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("15 transações"),
                    trailing: const Text(
                      "R\$ 3.534,80",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
