import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/MinhasVendasComponent.dart';
import '../components/ParcialFinanceiraComponent.dart';
import '../components/TopBarVendasFilterComponent.dart';
import '../components/UltimasVendasComponent.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(16, 48, 79, 1),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const TopBarVendasFilterComponent(),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: ParcialFinanceiraComponent(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 38),
                        child: SizedBox(
                          height: 120,
                          child: Card(
                            elevation: 10,
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 18, top: 7, right: 20),
                                      child: Text(
                                        "Vendas Efetivadas",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(28, 25, 57, 0.8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color:
                                                Color.fromRGBO(16, 48, 79, 1),
                                            size: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 7),
                                            child: Text(
                                              "3532",
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    28, 25, 57, 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Text(
                                        "Vendas do Dia",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(28, 25, 57, 0.8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            color:
                                                Color.fromRGBO(16, 48, 79, 1),
                                            size: 10,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 7),
                                            child: Text(
                                              "1050",
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    28, 25, 57, 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 18, top: 7, right: 20),
                                      child: Text(
                                        "Vendas não enviadas",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(28, 25, 57, 0.8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            color:
                                                Color.fromRGBO(239, 156, 0, 1),
                                            size: 10,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 7),
                                            child: Text(
                                              "505",
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    28, 25, 57, 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 18),
                                      child: Text(
                                        "Vendas da Semana",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(28, 25, 57, 0.8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            color:
                                                Color.fromRGBO(239, 156, 0, 1),
                                            size: 10,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 7),
                                            child: Text(
                                              "150",
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    28, 25, 57, 1),
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Text(
                                "Atividade",
                                style: TextStyle(
                                  color: Color.fromRGBO(16, 48, 79, 1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const MinhasVendasComponent(),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 45),
                        child: UltimasVendasComponent(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
