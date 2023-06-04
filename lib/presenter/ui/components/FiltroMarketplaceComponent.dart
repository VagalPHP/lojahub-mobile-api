import 'package:flutter/material.dart';

class FiltroMarketplacesComponent extends StatelessWidget {
  const FiltroMarketplacesComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width -
                80, // Calculando width responsivamente, respeitando os 40 de padding de cada lado da tela
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromRGBO(16, 48, 79, 1),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      backgroundImage: AssetImage(
                        'images/api_logos/${index + 1}.png',
                        // height: 20,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
