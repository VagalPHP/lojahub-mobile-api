import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(16, 48, 79, 1),
          ),
          decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CircleAvatar(
                backgroundColor: Color.fromRGBO(16, 48, 79, 1),
                child: Icon(
                  Icons.search,
                ),
              ),
            ),
            hintText: "Pesquisar vendas pelo código",
            hintStyle: TextStyle(fontSize: 14),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
