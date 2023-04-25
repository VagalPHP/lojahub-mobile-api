import 'dart:ffi';

class SalesOverviewModel {
  final Double sales_amount;
  final Object sales_overview;
  final Object last_sales;

  SalesOverviewModel(
      {required this.sales_amount,
      required this.sales_overview,
      required this.last_sales});
}
