import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:lojahub/infra/models/sales/UserSalesModel.dart';

class SalesRepository {
  final String _endpoint = 'http://10.0.2.2:8888/api/sales/overview';

  getSalesOverview(int? monthReference) async {
    Map<String, dynamic> queryParams = {};
    if (monthReference is int) {
      queryParams.addAll({'monthReference': "$monthReference"});
    }
    var headers = {
      // HttpHeaders.authorizationHeader: 'Token $token', auth no futuro
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uriObject = Uri.parse(_endpoint);
    Response response = await get(
        uriObject.replace(queryParameters: queryParams),
        headers: headers);

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }

    final responseData = jsonDecode(response.body)["data"];
    final List<LastSale> lastSalesList =
        (responseData["overview"]["lastSales"] as List)
            .map((mktLastSale) => LastSale.fromJson(mktLastSale))
            .toList();
    final List<MonthsFilter> monthsFilter =
        (responseData["monthsFilter"] as List)
            .map((monthFilter) => MonthsFilter.fromJson(monthFilter))
            .toList();

    if (responseData["overview"]["salesAmount"] is int) {
      responseData["overview"]["salesAmount"] =
          (responseData["overview"]["salesAmount"] as int).toDouble();
    }

    final UserSalesModel userSales = UserSalesModel(
      salesAmount: responseData["overview"]["salesAmount"],
      salesOverview:
          SalesOverview.fromJson(responseData["overview"]["salesOverview"]),
      lastSales: lastSalesList,
      monthReference: responseData["monthReference"],
      monthsFilter: monthsFilter,
    );
    return userSales;
  }
}
