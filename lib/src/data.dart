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

                                //itemExtent: 42
                              //scrollDirection: Axis.vertical,
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
                                      //Navigator.push(context, MaterialPageRoute(builder: (context) => FinalView(signCity,Address,signDate,fioExecutor,fioDirector,Room,ID,armBarcode,keyboardBarcode,mouseBarcode)));
                                    },
                                    child: Text('Отправить данные'),
                                  ),
                                ),
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
