import 'dart:ffi';

import 'package:intl/intl.dart';

class UserSalesModel {
  final double salesAmount;
  final SalesOverview salesOverview;
  final List<LastSale> lastSales;

  UserSalesModel(
      {required this.salesAmount,
      required this.salesOverview,
      required this.lastSales});

  String getFormatedSalesAmount() {
    final oCcy = NumberFormat("#,##0.00", "pt");
    return oCcy.format(salesAmount);
  }
}

class SalesOverview {
  final int completed;
  final int notSended;
  final int fromToday;
  final int fromWeek;

  SalesOverview(this.completed, this.notSended, this.fromToday, this.fromWeek);

  factory SalesOverview.fromJson(Map<String, dynamic> salesOverview) {
    return SalesOverview(salesOverview["completed"], salesOverview["notSended"],
        salesOverview["fromToday"], salesOverview["fromWeek"]);
  }
}

class LastSale {
  final String marketplaceName;
  final int mktSalesCount;
  final double mktSalesAmount;
  final String marketplaceLogo;

  LastSale(
      {required this.marketplaceName,
      required this.mktSalesCount,
      required this.mktSalesAmount,
      required this.marketplaceLogo});

  factory LastSale.fromJson(Map<String, dynamic> saleJson) {
    if (saleJson["mktSalesAmount"] is int) {
      saleJson["mktSalesAmount"] =
          (saleJson["mktSalesAmount"] as int).toDouble();
    }
    return LastSale(
        marketplaceName: saleJson["marketplaceName"],
        mktSalesCount: saleJson["mktSalesCount"],
        mktSalesAmount: saleJson["mktSalesAmount"],
        marketplaceLogo: saleJson["marketplaceLogo"]);
  }

  String getFormatedMktSalesAmount() {
    final oCcy = NumberFormat("#,##0.00", "pt");
    return oCcy.format(mktSalesAmount);
  }
}
