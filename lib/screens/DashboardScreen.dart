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
import '../components/VendasCountByStatusPainelComponent.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SalesOverviewBloc(RepositoryProvider.of<SalesRepository>(context))
            ..add(LoadSalesOverviewEvent(monthReference: null)),
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
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
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
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
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
                              TopBarVendasFilterComponent(
                                monthReference: userSales.monthReference,
                                monthsFilter: userSales.monthsFilter,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: ParcialFinanceiraComponent(
                                    salesAmount:
                                        userSales.getFormatedSalesAmount()),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 38),
                                child: VendasCountByStatusPainelComponent(
                                    userSales: userSales),
                              ),
                              // Minhas Vendas Component
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        "Atividade",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
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
