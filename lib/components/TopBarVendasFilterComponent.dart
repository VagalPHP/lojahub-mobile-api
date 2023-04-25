import 'package:flutter/material.dart';

@immutable
class TopBarVendasFilterComponent extends StatelessWidget {
  const TopBarVendasFilterComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/api_logos/0.png',
          height: 31,
          width: 29,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 7),
          child: Text(
            "Mês: Outubro",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(158, 166, 190, 1),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 7),
          child: Icon(
            Icons.filter_list,
            color: Color.fromRGBO(140, 151, 176, 1),
          ),
        ),
      ],
    );
  }
}
