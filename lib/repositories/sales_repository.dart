import 'package:http/http.dart';

class SalesRepository {
  final String _endpoint = 'http://localhost:8888/api/sales/overview';

  getSalesOverview() async {
    Response response = await get(Uri.parse(_endpoint));

    if (response.statusCode != 200) {
      throw Exception(response.reasonPhrase);
    }
  }
}
