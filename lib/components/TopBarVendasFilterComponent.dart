import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lojahub/blocs/events/sales_events.dart';
import 'package:lojahub/blocs/sales/sales_overview_bloc.dart';
import 'package:lojahub/models/sales/UserSalesModel.dart';

@immutable
class TopBarVendasFilterComponent extends StatelessWidget {
  const TopBarVendasFilterComponent({
    super.key,
    required this.monthReference,
    required this.monthsFilter,
  });

  final int monthReference;
  final List<MonthsFilter> monthsFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: Flexible(
            flex: 1,
            child: Image.network(
              'http://10.0.2.2:8888/images/apis_logo/7.png',
              height: 31,
              width: 29,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          flex: 3,
          child: MonthFilterComponent(
            monthReference: monthReference,
            monthsFilter: monthsFilter,
          ),
        ),
      ],
    );
  }
}

class MonthFilterComponent extends StatelessWidget {
  const MonthFilterComponent({
    super.key,
    required this.monthReference,
    required this.monthsFilter,
  });

  final int monthReference;
  final List<MonthsFilter> monthsFilter;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        items: getDropDownItems(monthsFilter),
        value: monthReference,
        onChanged: (int? newMonthReference) {
          BlocProvider.of<SalesOverviewBloc>(context)
              .add(LoadSalesOverviewEvent(monthReference: newMonthReference));
        },
        alignment: Alignment.center,
        style: const TextStyle(
            color: Color.fromRGBO(158, 166, 190, 1), fontSize: 16),
        icon: const Icon(
          Icons.filter_list,
          color: Color.fromRGBO(140, 151, 176, 1),
        ),
        dropdownColor: const Color.fromRGBO(16, 48, 79, 1),
      ),
    );
  }
}

List<DropdownMenuItem<int>> get dropdownItems {
  List<DropdownMenuItem<int>> menuItems = [
    const DropdownMenuItem(value: 1, child: Text("Janeiro 2023")),
    const DropdownMenuItem(value: 2, child: Text("Fevereiro 2023")),
    const DropdownMenuItem(value: 3, child: Text("Março 2023")),
    const DropdownMenuItem(value: 4, child: Text("Abril 2023")),
    const DropdownMenuItem(value: 5, child: Text("Dezembro 2023")),
  ];
  return menuItems;
}

List<DropdownMenuItem<int>> getDropDownItems(List<MonthsFilter> monthsFilter) {
  List<DropdownMenuItem<int>> menuItems = [];
  menuItems.addAll(monthsFilter.map((monthFilter) {
    return DropdownMenuItem(
      value: monthFilter.monthIndex,
      child: Text("${monthFilter.month} ${monthFilter.year}"),
    );
  }));
  return menuItems;
}
