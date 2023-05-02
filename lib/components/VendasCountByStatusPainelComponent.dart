import 'package:flutter/material.dart';

import '../models/sales/UserSalesModel.dart';

class VendasCountByStatusPainelComponent extends StatelessWidget {
  const VendasCountByStatusPainelComponent({
    super.key,
    required this.userSales,
  });

  final UserSalesModel userSales;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        elevation: 10,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Vendas Efetivadas e Vendas do Dia
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Vendas Efetivadas
                const Padding(
                  padding: EdgeInsets.only(left: 18, top: 7, right: 20),
                  child: Text(
                    "Vendas Efetivadas",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(28, 25, 57, 0.8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Color.fromRGBO(16, 48, 79, 1),
                        size: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          "${userSales.salesOverview.completed}",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(28, 25, 57, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Vendas do Dia
                const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    "Vendas do Dia",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(28, 25, 57, 0.8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Color.fromRGBO(16, 48, 79, 1),
                        size: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          "${userSales.salesOverview.fromToday}",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(28, 25, 57, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Vendas não enviadas e Vendas da Semana
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Vendas não enviadas
                const Padding(
                  padding: EdgeInsets.only(left: 18, top: 7, right: 20),
                  child: Text(
                    "Vendas não enviadas",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(28, 25, 57, 0.8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Color.fromRGBO(239, 156, 0, 1),
                        size: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          "${userSales.salesOverview.notSended}",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(28, 25, 57, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Vendas da Semana
                const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    "Vendas da Semana",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(28, 25, 57, 0.8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Color.fromRGBO(239, 156, 0, 1),
                        size: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          "${userSales.salesOverview.fromWeek}",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(28, 25, 57, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
