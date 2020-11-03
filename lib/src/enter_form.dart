import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';
import 'scan/scan_form.dart';
import 'package:date_format/date_format.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'actmodel.g.dart';
// part 'arm.g.dart';


class FormWidgetsDemo extends StatefulWidget {
  String signCity;
  String fioExecutor;
  String fioDirector;
  String Address = "";

  FormWidgetsDemo(this.fioExecutor,this.fioDirector);
  @override
  _FormWidgetsDemoState createState() => _FormWidgetsDemoState(this.fioExecutor,this.fioDirector);
}

class ARM {
  final String Address;
  final String Room;
  final String ID;
  final String ArmBarcode;
  final String KeyboardBarcode;
  final String MouseBarcode;

  ARM({this.Address, this.Room, this.ID, this.ArmBarcode, this.KeyboardBarcode, this.MouseBarcode});

  factory ARM.fromJson(Map<String, dynamic> json) {
    return ARM(
        Address: json['Address'],
        Room: json['Room'],
        ID: json['ID'],
        ArmBarcode: json['ArmBarcode'],
        KeyboardBarcode: json['KeyboardBarcode'],
        MouseBarcode: json['MouseBarcode']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Address': Address,
      'Room': Room,
      'ID' : ID,
      'ArmBarcode' : ArmBarcode,
      'KeyboardBarcode' :KeyboardBarcode,
      'MouseBarcode' : MouseBarcode
    };
  }
}

@JsonSerializable()

class Actmodel {
   String FIOexecutor;
   String FIOdirector;
   String SignDate;
   String SignCity;
   List<ARM> list = new List<ARM>();

   Actmodel({this.FIOexecutor,this.FIOdirector,this.SignCity,this.SignDate,this.list});

   factory Actmodel.fromJson(Map<String, dynamic> json) {
     return Actmodel(
         FIOexecutor: json['FIO_executor'],
         FIOdirector: json['FIO_director'],
         SignCity: json['signsity'],
         SignDate: json['signdate'],
         list: json['list']
     );
   }

   Map<String, dynamic> toJson() {
     return {
       'FIO_executor': FIOexecutor,
       'FIO_director': FIOdirector,
       'signsity' : SignCity,
       'signdate' : SignDate,
       'list' : list
     };
   }
}

class ListItem {
  int value = 1;
  String name;
  ListItem(this.value, this.name);
}
class _FormWidgetsDemoState extends State<FormWidgetsDemo> {
  String signCity;
  String fioExecutor;
  String fioDirector;
  String Address = "";
  DateTime date = DateTime.now();
  String signDate;

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  _FormWidgetsDemoState(this.fioExecutor,this.fioDirector);

  List<ListItem> _dropdownItems = [
    ListItem(1, "Владивосток"),
    ListItem(2, "Дальнереченск"),
    ListItem(3, "Лесозаводск"),
    ListItem(4, "Партизанск"),
    ListItem(5, "Спасск-Дальний"),
    ListItem(6, "п. Новый"),
    ListItem(7, "п. Раздольное"),
    ListItem(8, "п. Тавричанка"),
    ListItem(9, "с. Вольно-Надеждинское"),
    ListItem(10, "с. Новосельское"),
    ListItem(11, "с. Чкаловское"),
    ListItem(12, "с. Александровка"),
    ListItem(13, "с. Спасское"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    //super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> menuitems = List();
  bool disabledropdown = true;
  final _formKey = GlobalKey<FormState>();

  final Vladivostok = {
    "1" : "Адмирала Горшкова, 3",
    "2" : "улица Адмирала Кузнецова, 64А",
    "3" : "Борисенко 31",
    "4" : "улица Кирова,  66",
    "5" : "улица Крыгина, 19",
    "6" : "улица Можайская, 1б",
    "7" : "улица Приморская, 6",
    "8" : "улица Светланская, 105",
    "9" : "улица Спортивная,  11",
    "10" : "улица Уборевича, 14",
    "11" : "улица Уборевича, 30/37",
    "12" : "улица Черемуховая, 11",
    "13" : "улица 50 лет ВЛКСМ, 17",
  };
  final Dalnerechensk = {
    "1" : "улица Калинина, 72",
    "2" : "улица Ленина, 34",
    "3" : "улица Пушкина, 17А",
    "4" : "улица Фадеева, 70а",
    "5" : "улица Фадеева, 70в",
    "6" : "улица Фадеева, дом 70",
  };
  final Lesozavodsk = {
    "1" : "улица Калининская, 48",
    "2" : "улица Куйбышева, дом 7",
    "3" : "улица Октябрьская, 84",
    "4" : "улица Пушкинская, дом 38",
    "5" : "улица Пушкинская, дом 50",
    "6" : "улица Степная, 3",
    "7" : "улица 9 Января, 102А",
    "8" : "улица 9 Января, 102А1",
    "9" : "улица 9 Января, 102А2",
    "10" : "улица 9 Января, 102Б",
    "11" : "улица 9 Января, 102В",
    "12" : "с. Пантелеймоновка, улица Центральная, 58а",
  };
  final Partizansk = {
    "1" : "улица Вахрушева, 6",
    "2" : "улица Индустриальная, 20",
    "3" : "улица Лазо, 4",
    "4" : "улица Ленинская, 28",
    "5" : "улица Ленинская, 28а",
    "6" : "улица Ленинская, 30",
    "7" : "улица Ленинская, 45",
    "8" : "улица Павла Разгонова, 37",
    "9" : "улица Щорса, 20",
    "10" : "с. Авангард, ул. Кирова, 33",
    "11" : "с. Углекаменск, переулок Больничный, 12А",
    "12" : "с. Углекаменск, улица Калинина, 2",
    "13" : "с. Углекаменск, улица Калинина, 2А",
    "14" : "улица 50 лет ВЛКСМ, 28",
  };
  final Spassk = {
    "1" : "улица Дербенёва, 21",
    "2" : "улица Дербенёва, дом 23а",
    "3" : "улица Красногвардейская, дом 95а",
    "4" : "улица Ленинская, 29",
    "5" : "улица Парковая, 51",
    "6" : "улица Советская, 43",
    "7" : "переулок Мухинский, дом 6",
  };
  final Novii = {
    "1" : "улица Ленина, 12",
    "2" : "улица Ленина, 13",
  };
  final VN = {
    "1" : "улица Железнодорожная, 9Б",
    "2" : "улица Пушкина, 61",
    "3" : "улица Пушкина, 61В",
    "4" : "улица Р.Дрегиса, 9",
  };
  final NovSel = {
    "1" : "улица Центральная, 3а",
  };
  final Chkal = {
    "1" : "улица Ленина, 96",
  };
  final Alex = {
    "1" : "улица Партизанская, 54а",
  };
  final Spasskoe = {
    "1" : "улица Хрещатинская, 68",
  };
  final Razdolnoe = {
    "1" : "улица Котовского, дом 1Г"
  };
  final Tavr = {
    "1" : "улица Лазо, 3"
  };

  void populateVladivostok(){
    for(String key in Vladivostok.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text(Vladivostok[key]),
        ),
        value: Vladivostok[key],
      ));
    }
  }
  void populateDalnerechensk(){
    for(String key in Dalnerechensk.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text(Dalnerechensk[key]),
        ),
        value: Dalnerechensk[key],
      ));
    }
  }
  void populateLesozavodsk(){
    for(String key in  Lesozavodsk.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text( Lesozavodsk[key]),
        ),
        value:  Lesozavodsk[key],
      ));
    }
  }
  void populatePartizansk(){
    for(String key in  Partizansk.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text( Partizansk[key]),
        ),
        value:  Partizansk[key],
      ));
    }
  }
  void populateSpassk(){
    for(String key in Spassk.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text(Spassk[key]),
        ),
        value: Spassk[key],
      ));
    }
  }
  void populateNovii(){
    for(String key in  Novii.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text( Novii[key]),
        ),
        value: Novii[key],
      ));
    }
  }
  void populateVN(){
    for(String key in VN.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text( VN[key]),
        ),
        value: VN[key],
      ));
    }
  }
  void populateNovSel(){
    for(String key in NovSel.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text( NovSel[key]),
        ),
        value: NovSel[key],
      ));
    }
  }
  void populateChkal(){
    for(String key in  Chkal.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text(Chkal[key]),
        ),
        value:Chkal[key],
      ));
    }
  }
  void populateAlex(){
    for(String key in  Alex.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text(  Alex[key]),
        ),
        value:  Alex[key],
      ));
    }
  }
  void populateSpasskoe(){
    for(String key in  Spasskoe.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text(Spasskoe[key]),
        ),
        value:Spasskoe[key],
      ));
    }
  }
  void populateRazdolnoe(){
    for(String key in  Razdolnoe.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text(Razdolnoe[key]),
        ),
        value:Razdolnoe[key],
      ));
    }
  }
  void populateTavrichanka() {
    for(String key in  Tavr.keys){
      menuitems.add(DropdownMenuItem<String>(
        child : Center(
          child: Text(Tavr[key]),
        ),
        value:Tavr[key],
      ));
    }
  }
  void selected(_value){
    switch(_value) {
      case "Владивосток" : {
        menuitems = [];
        populateVladivostok();
        break;
      }
      case "Дальнереченск" : {
        menuitems = [];
        populateDalnerechensk();
        break;
      }
      case "Лесозаводск" : {
        menuitems = [];
        populateLesozavodsk();
        break;
      }
      case "Партизанск" : {
        menuitems = [];
        populatePartizansk();
        break;
      }
      case "Спасск-Дальний" : {
        menuitems = [];
        populateSpassk();
        break;
      }
      case "п. Новый" : {
        menuitems = [];
        populateNovii();
        break;
      }
      case "с. Вольно-Надеждинское" : {
        menuitems = [];
        populateVN();
        break;
      }
      case "с. Новосельское" : {
        menuitems = [];
        populateNovSel();
        break;
      }
      case "с. Чкаловское" : {
        menuitems = [];
        populateChkal();
        break;
      }
      case "с. Александровка" : {
        menuitems = [];
        populateAlex();
        break;
      }
      case "с. Спасское" : {
        menuitems = [];
        populateSpasskoe();
        break;
      }
      case "п. Раздольное" : {
        menuitems = [];
        populateRazdolnoe();
        break;
      }
      case "п. Тавричанка" : {
        menuitems = [];
        populateTavrichanka();
        break;
      }
    }
    setState(() {
      signCity = _value;
      disabledropdown = false;
    });
  }
  void secondselected(_value){
    setState(() {
     Address = _value;
    });
  }

  void clearFields() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ввод данных'),
        automaticallyImplyLeading: false,
      ),
      body: Form (
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        DropdownButtonFormField<ListItem>(
                            //  value: _selectedItem,
                            items: _dropdownMenuItems,
                            onChanged: (value) {
                              setState(() {
                                _selectedItem = value;
                                selected(_selectedItem.name);
                                signCity = _selectedItem.name;
                              });
                            },
                            hint: Text('Выберите населённый пункт'),
                            validator: (value) => value == null
                              ? 'Выберите населённый пункт': null,
                        ),
                         DropdownButtonFormField<String>(
                          items: menuitems,
                          onChanged: disabledropdown ? null : (_value) {
                            secondselected(_value);
                            Address = _value;
                            print(Address);
                          },
                          hint: Text('Адрес: ' + Address),
                          validator: (value) => value == null
                              ? 'Выберите адрес': null,
                        ),
                        TextFormField(
                          enabled: true,
                          //controller: executor,
                          initialValue: fioExecutor,
                          decoration: InputDecoration (
                            labelText: 'ФИО исполнителя',
                          ),
                          keyboardType: TextInputType.name,
                          onChanged: (String value) {
                            fioExecutor = value;
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
                          //controller: director,
                          initialValue: fioDirector,
                          decoration: InputDecoration (
                            labelText: 'ФИО директора',
                          ),
                          keyboardType: TextInputType.name,
                          onChanged: (String value) {
                            fioDirector = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Необходимо заполнить поле';
                            }
                            return null;
                          },
                        ),
                        _FormDatePicker(
                          date: date,
                          onChanged: (value) {
                            setState(() {
                              date = value;
                            });
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
                                    borderRadius: new BorderRadius.circular(
                                        30.0)
                                ),
                                onPressed: () {
                                  signDate = (formatDate(DateTime(date.year, date.month, date.day, date.hour, date.minute, date.second), [yyyy, '-', mm, '-', dd, " ", HH, ':', nn, ':', ss]));
                                  Address = signCity + ", " + Address;
                                  print(signDate);
                                    if (_formKey.currentState.validate()) {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              QRViewExample(
                                                  signCity,
                                                  Address,
                                                  signDate,
                                                  fioExecutor,
                                                  fioDirector,
                                                  "",
                                                  "",
                                                  "",
                                                  "",
                                                  "")));
                                    };
                                },
                                child: Text("Продолжить",
                                    style: TextStyle(fontSize: 15)),
                              ),
                            )
                          ],
                        ),
                      ].expand(
                            (widget) =>
                        [
                          widget,
                          SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged onChanged;

  _FormDatePicker({
    this.date,
    this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Дата',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        FlatButton(
          child: Text('Изменить'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }
            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}
