import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_movil/domain/controlle/controllerArticle.dart';
import 'package:proyecto_movil/domain/controlle/controllerUser.dart';
import 'package:proyecto_movil/ui/pages/menu.dart';

class SalesData {
  final String category;
  final int sales;

  SalesData(this.category, this.sales);
}

class MenuBodega extends StatefulWidget {
  const MenuBodega({Key? key});

  @override
  State<MenuBodega> createState() => _MenuBodegaState();
}

class _MenuBodegaState extends State<MenuBodega> {
  ControllerArticle controlA = Get.find();
  @override
  Widget build(BuildContext context) {
    
    List<SalesData> data = [
      SalesData('Total Articulos', 100),
      SalesData('Valor',1500),
      // Agrega más datos según sea necesario
    ];

    final series = [
      charts.Series(
        id: 'Sales',
        data: data,
        domainFn: (SalesData sales, _) => sales.category,
        measureFn: (SalesData sales, _) => sales.sales,
      ),
    ];

    ControllerUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Bodega"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "WELCOME ${controlu.listaUserLogin![0].Name} ${controlu.listaUserLogin![0].surName}",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Statistics",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Total Items: 100",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      "Available Items: 80",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      "Sold Items: 20",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16),
                    Container(
                            height: 200,
                            child: charts.BarChart(
                              series,
                              animate: true,
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Menu(
        Name: controlu.listaUserLogin![0].Name,
        surName: controlu.listaUserLogin![0].surName,
      ),
    );
  }
}
