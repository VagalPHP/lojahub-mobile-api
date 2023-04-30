import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:lojahub/models/sales/UserSalesModel.dart';

class SalesRepository {
  final String _endpoint = 'http://10.0.2.2:8888/api/sales/overview';

  getSalesOverview() async {
    Response response = await get(Uri.parse(_endpoint));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }
    final responseData = jsonDecode(response.body)["data"];
    final List<LastSale> lastSalesList = (responseData["lastSales"] as List)
        .map((e) => LastSale.fromJson(e))
        .toList();

    if (responseData["salesAmount"] is int) {
      responseData["salesAmount"] =
          (responseData["salesAmount"] as int).toDouble();
    }

    final UserSalesModel userSales = UserSalesModel(
        salesAmount: responseData["salesAmount"],
        salesOverview: SalesOverview.fromJson(responseData["salesOverview"]),
        lastSales: lastSalesList);
    return userSales;
  }
}
