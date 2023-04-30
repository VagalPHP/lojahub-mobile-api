import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojahub/blocs/events/sales_events.dart';
import 'package:lojahub/blocs/sales/sales_overview_bloc.dart';
import 'package:lojahub/blocs/states/sales_states.dart';
import 'package:lojahub/models/sales/UserSalesModel.dart';
import 'package:lojahub/repositories/sales_repository.dart';

import '../components/MinhasVendasComponent.dart';
import '../components/ParcialFinanceiraComponent.dart';
import '../components/TopBarVendasFilterComponent.dart';
import '../components/UltimasVendasComponent.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SalesOverviewBloc(RepositoryProvider.of<SalesRepository>(context))
            ..add(LoadSalesOverviewEvent()),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(227, 242, 253, 1),
        body: SafeArea(
          child: BlocBuilder<SalesOverviewBloc, SalesState>(
            builder: (context, state) {
              if (state is SalesLoadingState) {
                return Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(16, 48, 79, 1),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Color.fromRGBO(239, 156, 0, 1),
                        color: Color.fromRGBO(228, 124, 27, 1),
                      ),
                    ),
                  ),
                );
              }

              if (state is SalesLoadedState) {
                // Dados da API
                final UserSalesModel userSales = state.userSales;
                return Stack(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 25),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const TopBarVendasFilterComponent(),

                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: ParcialFinanceiraComponent(
                                    salesAmount:
                                        userSales.getFormatedSalesAmount()),
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
                                        // Vendas Efetivadas e Vendas do Dia
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Vendas Efetivadas
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 18, top: 7, right: 20),
                                              child: Text(
                                                "Vendas Efetivadas",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      28, 25, 57, 0.8),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.circle,
                                                    color: Color.fromRGBO(
                                                        16, 48, 79, 1),
                                                    size: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 7),
                                                    child: Text(
                                                      "${userSales.salesOverview.completed}",
                                                      style: const TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromRGBO(
                                                            28, 25, 57, 1),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Vendas do Dia
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 18),
                                              child: Text(
                                                "Vendas do Dia",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      28, 25, 57, 0.8),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.circle,
                                                    color: Color.fromRGBO(
                                                        16, 48, 79, 1),
                                                    size: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 7),
                                                    child: Text(
                                                      "${userSales.salesOverview.fromToday}",
                                                      style: const TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.w700,
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
                                        // Vendas não enviadas e Vendas da Semana
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Vendas não enviadas
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 18, top: 7, right: 20),
                                              child: Text(
                                                "Vendas não enviadas",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      28, 25, 57, 0.8),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.circle,
                                                    color: Color.fromRGBO(
                                                        239, 156, 0, 1),
                                                    size: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 7),
                                                    child: Text(
                                                      "${userSales.salesOverview.notSended}",
                                                      style: const TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Color.fromRGBO(
                                                            28, 25, 57, 1),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Vendas da Semana
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 18),
                                              child: Text(
                                                "Vendas da Semana",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      28, 25, 57, 0.8),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.circle,
                                                    color: Color.fromRGBO(
                                                        239, 156, 0, 1),
                                                    size: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 7),
                                                    child: Text(
                                                      "${userSales.salesOverview.fromWeek}",
                                                      style: const TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.w700,
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
                              // Minhas Vendas Component
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
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
                                    MinhasVendasComponent(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 45),
                                child: UltimasVendasComponent(
                                    lastSalesList: userSales.lastSales),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (state is SalesErrorState) {
                // dados estáticos
                return Container();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
