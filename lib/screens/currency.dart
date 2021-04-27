import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/services/currency_api.dart';
import 'package:flutter_project/widgets/drop_down.dart';

class Currency extends StatefulWidget {
  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {

  CurrencyApi client = CurrencyApi();

  Color mainColor = Colors.white;
  Color secondaryColor = Colors.blue;

  List<String> currencies = ["USD", "JPY"];
  String from;
  String to;

  double rate;
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
        appBar: AppBar(
          title: const Text('Currency Converter'),
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          dropDown(currencies, from, (val) {
                            setState(() {
                              from = val;
                            });
                          }),
                          FloatingActionButton(
                            onPressed: (){
                              String temp = from;
                              setState(() {
                                from = to;
                                to = temp;
                              });
                            },
                            child: Icon(Icons.swap_horiz),
                            elevation: 0.0,
                            backgroundColor: secondaryColor,
                          ),
                          dropDown(currencies, to, (val) {
                            setState(() {
                              to = val;
                            });
                          }),
                        ],
                      ),
                      SizedBox(height: 50.0),
                      Text(
                        'Input value to convert',
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 16.0
                        ),

                      ),
                      TextField(
                        onSubmitted: (value) async {
                          rate = await client.getRate(from, to);
                          setState(() {
                            result =
                              (rate * double.parse(value)).toStringAsFixed(2);
                          });
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Converted value:",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18.0,
                                color: secondaryColor,
                              )
                          )
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          children: [
                            Text(result, style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            )),
                          ]
                        )
                      )
                    ],
                  ),
                )
              )
            ],
          )
        )
      )
    );
  }
}