import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../enter_form.dart';
import 'scan_overlay.dart';


Future<Computer> createComputer(String Address, String Room, String ID, String ArmBarcode, String KeyboardBarcode, String MouseBarcode) async {
  HttpClient client = new HttpClient();
  client.badCertificateCallback = ((X509Certificate cert, String host, int port) {
    final isValidHost = host == "api/ARM/POST";
    return isValidHost;
  });
  final http.Response response = await http.post(
    'http://ithelp.it4us.ru:8085/api/ARM/POST',
    //'https://jsonplaceholder.typicode.com/albums',
    headers: <String, String>{
      //'Content-Type': 'application/json; charset=UTF-8',
      "content-type" : "application/json",
      "accept" : "application/json",
    },
    body: jsonEncode(<String, String>{
      'Address': Address,
      'Room' : Room,
      'ID' : ID,
      'ArmBarcode' : ArmBarcode,
      'KeyboardBarcode' : KeyboardBarcode,
      'MouseBarcode' : MouseBarcode
    }),
  );

  if (response.statusCode == 201) {
    print(response.body);
    return Computer.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

// Future<List<Computer>> cargarParticipantes() async {
//   final url = 'https://jsonplaceholder.typicode.com/albums'; // Your url
//   final resp = await http.get(url);
//   final respBody = json.decode(resp.body) as List;
//   final computers = respBody.map((x) => Computer.fromJson(x)).toList();
//   return computers;
// }

class Computer {
  final String Address;
  final String Room;
  final String ID;
  final String ArmBarcode;
  final String KeyboardBarcode;
  final String MouseBarcode;

  Computer(
      {this.Address, this.Room, this.ID, this.ArmBarcode, this.KeyboardBarcode, this.MouseBarcode});

  factory Computer.fromJson(Map<String, dynamic> json) {
    return Computer(
        Address: json['Address'],
        Room: json['Room'],
        ID: json['ID'],
        ArmBarcode: json['ArmBarcode'],
        KeyboardBarcode: json['KeyboardBarcode'],
        MouseBarcode: json['MouseBarcode']
    );
  }
}

class QRViewExample extends StatefulWidget {
   String Address;
   String Room;
   String ID;
   String armBarcode;
   String keyboardBarcode;
   String mouseBarcode;
  QRViewExample(this.Address,this.Room,this.ID,this.armBarcode,this.keyboardBarcode, this.mouseBarcode);

  @override
  State<StatefulWidget> createState() {
    return _QRViewExampleState(this.Address,this.Room,this.ID,this.armBarcode,this.keyboardBarcode, this.mouseBarcode);
  }
}

class _QRViewExampleState extends State<QRViewExample> {
  String Address;
  String Room;
  String ID;
  String armBarcode;
  String keyboardBarcode;
  String mouseBarcode;

  Future<Computer> _futureComputer;

  TextEditingController id = TextEditingController();

  _QRViewExampleState(this.Address, this.Room, this.ID, this.armBarcode,
      this.keyboardBarcode, this.mouseBarcode);

  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  initState() {
    super.initState();
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    final result1 = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QRFirstView(Address,Room,ID),
        ));
    setState(() {
      armBarcode = result1;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ввод данных"),
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )
      ),
      body: Column(
        children: <Widget>[
                 Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SingleChildScrollView(
                        padding: EdgeInsets.all(16),
                          child: (_futureComputer == null)
                    ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        enabled: false,
                        initialValue: Address,
                        decoration: InputDecoration (
                          labelText: 'Адрес',
                        ),
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: Room,
                        decoration: InputDecoration (
                          labelText: 'Кабинет',
                        ),
                      ),
                      TextFormField(
                        enabled: true,
                        initialValue: ID,
                        decoration: InputDecoration(
                            labelText: 'Серийный номер компьютера'
                        ),
                        keyboardType: TextInputType.name,
                        onChanged: (String value) {
                          ID = value;
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Необходимо заполнить поле';
                        //   }
                        // },
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: armBarcode,
                        decoration:  InputDecoration(
                          labelText: 'Баркод системного блока',
                        ),
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: keyboardBarcode,
                        //controller: barcode2,
                        decoration:  InputDecoration(
                          labelText: 'Баркод клавиатуры',
                        ),
                      ),
                      TextFormField(
                        enabled: false,
                        initialValue: mouseBarcode,
                        //controller: barcode2,
                        decoration:  InputDecoration(
                          labelText: 'Баркод компьютерной мыши',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(8),
                            child: RaisedButton(
                              color: Colors.blue,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0)
                              ),
                              onPressed: () {
                                _awaitReturnValueFromSecondScreen(context);
                              },
                              child: Text("Сканировать", style: TextStyle(fontSize: 15)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            child: RaisedButton(
                              color: Colors.blue,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0)
                              ),
                              onPressed: () {
                                setState(() {
                                  _futureComputer = createComputer(Address,Room,ID,armBarcode,keyboardBarcode,mouseBarcode);
                                  //createComputer(Address,Room,ID,armBarcode,keyboardBarcode,mouseBarcode);
                                });
                              },
                              child: Text('Отправить'),
                            ),
                          ),
                        ],
                      ),
                      Row (
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(8),
                              child: RaisedButton(
                                color: Colors.lightGreenAccent,
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0)
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => FormWidgetsDemo()));
                                },
                                child: Text("На главный экран", style: TextStyle(fontSize: 15)),
                              ),
                            ),
                            ]
                      ),
                    ]
                )
                    : FutureBuilder<Computer>(
                  future: _futureComputer,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text("Данные отправлены!");
                      //return Text(snapshot.data.ID);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
                ]
                ),
        ]
      ),
    );
  }
}
