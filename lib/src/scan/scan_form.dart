import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan2/src/data.dart';
import 'scan_overlay.dart';


class QRViewExample extends StatefulWidget {
   String signCity;
   String signDate;
   String fioExecutor;
   String fioDirector;
   String Address;
   String Room;
   String ID;
   String armBarcode;
   String keyboardBarcode;
   String mouseBarcode;
  QRViewExample(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID,this.armBarcode,this.keyboardBarcode,this.mouseBarcode);

  @override
  State<StatefulWidget> createState() {
    return _QRViewExampleState(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID,this.armBarcode,this.keyboardBarcode,this.mouseBarcode);
  }
}

class _QRViewExampleState extends State<QRViewExample> {
  String signCity;
  String signDate;
  String fioExecutor;
  String fioDirector;
  String Address;
  String Room;
  String ID;
  String armBarcode;
  String keyboardBarcode;
  String mouseBarcode;

  TextEditingController id = TextEditingController();

  _QRViewExampleState(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID,this.armBarcode,this.keyboardBarcode,this.mouseBarcode);

  QRViewController controller;
  //final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    final result1 = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QRFirstView(signCity,Address,signDate,fioExecutor,fioDirector,Room,ID),
        ));
    setState(() {
      armBarcode = result1;
      print(Room);
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
      body: Container (
             child: Form (
                key: _formKey,
                 child: ListView (
                    children: <Widget> [
                   Column(
                     //key: _formKey,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SingleChildScrollView(
                        padding: EdgeInsets.all(16),
                         child: Column (
                            mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: <Widget>[
                                TextFormField(
                                 enabled: true,
                                 initialValue: Room,
                                 decoration: InputDecoration (
                                   labelText: 'Кабинет',
                                 ),
                                 keyboardType: TextInputType.name,
                                 onChanged: (String value) {
                                   Room = value;
                                 },
                                 validator: (value) {
                                   if (value.isEmpty) {
                                     return 'Необходимо заполнить поле';
                                   }
                                   return null;
                                 },
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
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Необходимо заполнить поле';
                                  }
                                  return null;
                                },
                            ),
                             TextFormField(
                                 enabled: true,
                                 initialValue: armBarcode,
                                 decoration:  InputDecoration(
                                   labelText: 'Баркод системного блока',
                                 ),
                                 validator: (value) {
                                   if (value.isEmpty) {
                                     return 'Необходимо отсканировать баркод';
                                   }
                                   return null;
                                 },
                               ),
                           TextFormField(
                                 enabled: true,
                                 initialValue: keyboardBarcode,
                                 decoration:  InputDecoration(
                                   labelText: 'Баркод клавиатуры',
                                 ),
                                 validator: (value) {
                                   if (value.isEmpty) {
                                     return 'Необходимо отсканировать баркод';
                                   }
                                   return null;
                                 },
                               ),
                            TextFormField(
                                 enabled: true,
                                 initialValue: mouseBarcode,
                                 decoration:  InputDecoration(
                                   labelText: 'Баркод компьютерной мыши',
                                  ),
                                 validator: (value) {
                                   if (value.isEmpty) {
                                     return 'Необходимо отсканировать баркод';
                                   }
                                   return null;
                                 },
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
                                                    print(mouseBarcode);
                                                  if (_formKey.currentState.validate()) {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                FinalView(
                                                                    signCity,
                                                                    Address,
                                                                    signDate,
                                                                    fioExecutor,
                                                                    fioDirector,
                                                                    Room,
                                                                    ID,
                                                                    armBarcode,
                                                                    keyboardBarcode,
                                                                    mouseBarcode)));
                                                  };
                                                },
                                                 child: Text('Продолжить'),
                                              ),
                                           ),
                                     ],
                               ),
                          ]
                       )

                  ),
                ]
                ),
               ],
      ),
      ),
    ),
    );
  }
}
