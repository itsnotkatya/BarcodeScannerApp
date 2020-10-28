import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:scan2/src/enter_form.dart';

class FinalView extends StatefulWidget {
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
  FinalView(this.signCity,this.Address,this.signDate,this.fioExecutor,this.fioDirector,this.Room,this.ID,this.armBarcode,this.keyboardBarcode,this.mouseBarcode);

  @override
  State<StatefulWidget> createState() {
    return _FinalViewState(this.signCity,this.Address,this.signDate,this.fioExecutor,this.fioDirector,this.Room,this.ID,this.armBarcode,this.keyboardBarcode,this.mouseBarcode);
  }
}

class _FinalViewState extends State<FinalView> {
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
  _FinalViewState(this.signCity,this.Address,this.signDate,this.fioExecutor,this.fioDirector,this.Room,this.ID,this.armBarcode,this.keyboardBarcode,this.mouseBarcode);

  @override
  initState() {
    super.initState();
  }

  Future<ARM> createARM({Actmodel actmodel}) async {
    final http.Response response = await http.post(
      'http://ithelp.it4us.ru:8085/api/ARM/POST',
      headers: <String, String>{
        "Content-type" : "application/x-www-form-urlencoded",
        "accept" : "application/octet-stream"
      },
      body: "="+jsonEncode(actmodel),
    );
    print(response.statusCode);                         //statusCode == 500
    if (response.statusCode == 200) {
      print(response.body);                             //TODO: print data to file
      return ARM.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future<ARM> _futureARM;
  List<ARM> list = new List<ARM>();

  void sendData(String fioExecutor, String fioDirector, String signCity, String signDate) {

    var arm = new ARM(Address: Address,Room: Room,ID: ID,ArmBarcode: armBarcode,KeyboardBarcode: keyboardBarcode,MouseBarcode: mouseBarcode);

    list.add(arm);

    var actmodel = new Actmodel(fioExecutor,fioDirector,signCity,signDate,list);

    String json = jsonEncode(list);
    _futureARM = createARM(actmodel: actmodel);
    FutureBuilder<ARM>(
      future: _futureARM,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('Данные отправлены!');
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Проверка данных"),
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )
      ),
      body: ListView (
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                                TextFormField(
                                  enabled: false,
                                  initialValue: signCity,
                                  decoration: InputDecoration (
                                    labelText: 'Населённый пункт',
                                  ),
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: Address,
                                  decoration: InputDecoration (
                                    labelText: 'Адрес',
                                  ),
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: signDate,
                                  decoration:  InputDecoration(
                                    labelText: ' Дата',
                                  ),
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: fioExecutor,
                                  decoration:  InputDecoration(
                                    labelText: 'ФИО исполнителя',
                                  ),
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: fioDirector,
                                  decoration:  InputDecoration(
                                    labelText: 'ФИО директора',
                                  ),
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: Room,
                                  decoration:  InputDecoration(
                                    labelText: '№ Кабинета',
                                  ),
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: ID,
                                  decoration:  InputDecoration(
                                    labelText: 'Серийный номер компьютера',
                                  ),
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
                                  decoration:  InputDecoration(
                                    labelText: 'Баркод клавиатуры',
                                  ),
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: mouseBarcode,
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
                                        sendData(fioExecutor,fioExecutor,signCity,signDate);
                                      //Navigator.push(context, MaterialPageRoute(builder: (context) => FormWidgetsDemo(signCity,Address,fioExecutor,fioDirector)));
                                    },
                                    child: Text('Отправить данные'),
                                  ),
                                ),
                                 // Container(
                                 //   margin: EdgeInsets.all(8),
                                 //   child: RaisedButton(
                                 //     color: Colors.blue,
                                 //     shape: new RoundedRectangleBorder(
                                 //         borderRadius: new BorderRadius.circular(30.0)
                                 //     ),
                                 //     onPressed: () {
                                 //       Navigator.push(context, MaterialPageRoute(builder: (context) => FormWidgetsDemo(signCity,Address,fioExecutor,fioDirector)));
                                 //     },
                                 //     child: Text('На главный экран'),
                                 //   ),
                                 //),
                              ],
                            ),
                          ]
                      )
                  ),
                ]
            ),
          ]
      ),
    );
  }
}
