import 'package:flutter/material.dart';
import 'package:lojahub/models/sales/UserSalesModel.dart';

class UltimasVendasComponent extends StatelessWidget {
  const UltimasVendasComponent({
    super.key,
    this.lastSalesList,
  });

  final List<LastSale>? lastSalesList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Últimas Vendas (Do dia)",
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
            child: ListView.builder(
                itemCount: lastSalesList?.length ?? 0,
                itemBuilder: (context, index) {
                  final lastSale = lastSalesList![index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: SizedBox(
                        width: 26,
                        height: 26,
                        child: Image.network(
                          lastSale.marketplaceLogo,
                        ),
                      ),
                      title: Text(
                        lastSale.marketplaceName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${lastSale.mktSalesCount} transações"),
                      trailing: Text(
                        "R\$ ${lastSale.getFormatedMktSalesAmount()}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
