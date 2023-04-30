import 'package:flutter/material.dart';

@immutable
class TopBarVendasFilterComponent extends StatelessWidget {
  const TopBarVendasFilterComponent({
    super.key,
  });

  get onChanged => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          'http://10.0.2.2:8888/images/apis_logo/7.png',
          height: 31,
          width: 29,
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 4),
                child: Text(
                  "Mês:",
                  style: TextStyle(
                      color: Color.fromRGBO(158, 166, 190, 1), fontSize: 16),
                ),
              ),
              MonthFilterComponent(),
            ],
          ),
        ),
      ],
    );
  }
}

class MonthFilterComponent extends StatefulWidget {
  const MonthFilterComponent({
    super.key,
  });

  @override
  State<MonthFilterComponent> createState() => _MonthFilterComponentState();
}

class _MonthFilterComponentState extends State<MonthFilterComponent> {
  int selectedValue = 4;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        items: dropdownItems,
        value: selectedValue,
        onChanged: (int? value) {
          setState(() {
            selectedValue = value!;
          });
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
    const DropdownMenuItem(value: 1, child: Text("Janeiro")),
    const DropdownMenuItem(value: 2, child: Text("Fevereiro")),
    const DropdownMenuItem(value: 3, child: Text("Março")),
    const DropdownMenuItem(value: 4, child: Text("Abril")),
  ];
  return menuItems;
}
