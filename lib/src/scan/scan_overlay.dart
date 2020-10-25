import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan2/src/scan/scan_form.dart';

class QRFirstView extends StatefulWidget {
  String signCity;
  String signDate;
  String fioExecutor;
  String fioDirector;
  String Address;
   String Room;
   String ID;
   QRFirstView(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID);

  @override
  State<StatefulWidget> createState() {
    return _QRFirstViewState(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID);
  }
}

class _QRFirstViewState extends State<QRFirstView> {
  String signCity;
  String signDate;
  String fioExecutor;
  String fioDirector;
  String Address;
  String Room;
  String ID;
  QRViewController controller;
  _QRFirstViewState(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID);

  String armBarcode = "";
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Сканирование баркодов"),
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, QRViewExample),
          )
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Просканируйте баркод системного блока: ' + armBarcode, style: TextStyle(fontSize: 15, backgroundColor: Colors.lightGreenAccent)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      // Container(
                      //   child: RaisedButton(
                      //     child: Text('Сохранить', style: TextStyle(fontSize: 15)),
                      //     color: Colors.blue,
                      //     shape: new RoundedRectangleBorder(
                      //         borderRadius: new BorderRadius.circular(30.0)
                      //     ),
                      //     onPressed: () {
                      //      // _sendDataBack(context);
                      //     },
                      //   )
                      // ),
                      Container(
                          margin: EdgeInsets.all(8),
                          child: RaisedButton (
                            child: Text('Далее', style: TextStyle(fontSize: 15)),
                            color: Colors.blue,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)
                            ),
                            onPressed: () => {
                              print(Room),
                              Navigator.push(context, MaterialPageRoute(builder: (context) => QRSecondView(signCity,Address,signDate,fioExecutor,fioDirector,Room,ID,armBarcode))),
                            },
                          )
                      ),
                ],
              ),
              ]
            ),
          )
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        armBarcode = scanData;
      });
    });
  }

//   void _sendDataBack(BuildContext context) {
//     String textToSendBack = armBarcode;
//     Navigator.pop(context, textToSendBack);
//   }
 }

class QRSecondView extends StatefulWidget {
  String signCity;
  String signDate;
  String fioExecutor;
  String fioDirector;
  String Address;
  String Room;
  String ID;
  String armBarcode;
  QRSecondView(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID,this.armBarcode);
  @override
  State<StatefulWidget> createState() {
    return _QRSecondViewState(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID,this.armBarcode);
  }
}

class _QRSecondViewState extends State<QRSecondView> {
  String signCity;
  String signDate;
  String fioExecutor;
  String fioDirector;
  String Address;
  String Room;
  String ID;
  String armBarcode;
  _QRSecondViewState(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID,this.armBarcode);

  QRViewController controller;
  String keyboardBarcode = "";
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ввод данных"),
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, QRViewExample),
          )
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Просканируйте баркод клавиатуры: ' + keyboardBarcode, style: TextStyle(fontSize: 15, backgroundColor: Colors.lightGreenAccent)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.all(8),
                              child: RaisedButton (
                                child: Text('Далее', style: TextStyle(fontSize: 15)),
                                color: Colors.blue,
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0)
                                ),
                                onPressed: () => {
                                  print(Room),
                                Navigator.push(context, MaterialPageRoute(builder: (context) => QRThirdView(signCity,Address,signDate,fioExecutor,fioDirector,Room,ID,armBarcode,keyboardBarcode))),
                                },
                              )
                          )
                        ],
                      ),
                    ]
                ),
              )
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        keyboardBarcode = scanData;
      });
    });
  }

  // void _sendDataBack(BuildContext context) {
  //   String textToSendBack = keyboardBarcode;
  //   Navigator.pop(context, textToSendBack);
  // }
}

class QRThirdView extends StatefulWidget {
  String signCity;
  String signDate;
  String fioExecutor;
  String fioDirector;
  String Address;
  String Room;
  String ID;
  String armBarcode;
  String keyboardBarcode;
  QRThirdView(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID,this.armBarcode,this.keyboardBarcode);

  @override
  State<StatefulWidget> createState() {
    return _QRThirdViewState(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID,this.armBarcode,this.keyboardBarcode);
  }
}

class _QRThirdViewState extends State<QRThirdView>  {
  String signCity;
  String signDate;
  String fioExecutor;
  String fioDirector;
  String Address;
  String Room;
  String ID;
  String armBarcode;
  String keyboardBarcode;
  String mouseBarcode = "";
  _QRThirdViewState(this.signCity, this.Address,this.signDate, this.fioExecutor, this.fioDirector,this.Room,this.ID,this.armBarcode,this.keyboardBarcode);

  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Сканирование баркодов"),
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, QRViewExample),
          )
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Просканируйте баркод компьютерной мыши:' + mouseBarcode, style: TextStyle(fontSize: 15, backgroundColor: Colors.lightGreenAccent)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.all(8),
                              child: RaisedButton (
                                child: Text('Завершить сканирование', style: TextStyle(fontSize: 15)),
                                color: Colors.blue,
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0)
                                ),
                                onPressed: () => {
                                  print(Room),
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => QRViewExample(signCity,Address,signDate,fioExecutor,fioDirector,Room,ID,armBarcode,keyboardBarcode,mouseBarcode))),
                              },
                              )
                          )
                        ],
                      ),
                    ]
                ),
              )
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        mouseBarcode = scanData;
      });
    });
  }
}
