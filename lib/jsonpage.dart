import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;



class JsonPage extends StatefulWidget {
  final Widget child;

  JsonPage({Key key, this.child}) : super(key: key);

  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
 // final decoded = jsonDecode(DefaultAssetBundle.of(context).loadString("asset/jsondat.json")) as List;
  List<charts.Series<Sales, String>> seriesBarData;
// List because we have array of objects in Json file
  _generateData() {
    var barData =
    DefaultAssetBundle.of(context).loadString("asset/jsondat.json");
   // final decoded = jsonDecode(DefaultAssetBundle.of(context).loadString("asset/jsondat.json")) as List;
// Data we will get from JSON file
    seriesBarData.add(charts.Series(
  // Add the details of the graph
     data:barData,
      //   data: decoded,
      domainFn: (Sales sales, _) => sales.salesyear,
      measureFn: (Sales sales, _) => sales.salesval,
      id: 'Sales',
    ));
  }

  @override
  void initState() {
    super.initState();
    seriesBarData = jsonDecode(DefaultAssetBundle.of(context).loadString("asset/jsondat.json")) as List;
    // decoded data from JSON
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('flutter charts'),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Sales By Years',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                          child: charts.BarChart(
                            seriesBarData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Sales {
  String salesyear;
  double salesval;


  // Add Constructor
  Sales(this.salesyear, this.salesval);
}


/*class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}
Future < Map < String,
    String >> loadJson() async {
  final salesJsonData = await DefaultAssetBundle.of(context).loadString('data.json');
  return {
    'salesJSON': salesJsonData,
  };
}
class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      app: App(
        title: Text('Load JSON from Local'),
      ),
      body: Center(
        child: FutureBuilder(
            future: loadJson(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              var salesdata = json.decode(snapshot.data['salevalue.json']);
              for(int index  =0; index < 3; index++)
              {
                int monthtemp = int.parse(salesdata[index]['saleyear'].toString().split('/')[0]);
                var month  = formatDate(DateTime(monthtemp), [M]);
                print(month);
                data = [new BillSummary(month, int.parse(customerdata[index]['usage']),),
                ];
              }
              return chartWidget;
            }),

        ),
      ),
    );
  }
}
*/
// 1. create a model class which has our chart data. The class here is called ‘Sales’

/* class SalesList {
  final List<Sale> sales;

  SalesList({
    this.sales,
  });

  factory SalesList.fromJson(List<dynamic> parsedJson) {
    List<Sale> sales = new List<Sale>();
    sales = parsedJson.map((i) => Sale.fromJson(i)).toList();
    return new SalesList(sales: sales);
  }
}

class Sale {
  final String saleyear;
  final String saleval;

  Sale({
    this.saleyear,
    this.saleval,
  });

  factory Sale.fromJson(Map<String, dynamic> json) {
    return new Sale(
      saleyear: json['saleyear'].toString(),
      saleval: json['saleval'],
    );
  }
}
 */
/*
*/

