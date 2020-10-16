import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'scan/scan_form.dart';

class FormWidgetsDemo extends StatefulWidget {
  @override
  _FormWidgetsDemoState createState() => _FormWidgetsDemoState();
}

class ListItem {
  int value = 1;
  String name;
  ListItem(this.value, this.name);
}

class _FormWidgetsDemoState extends State<FormWidgetsDemo> {
  String Address = "Владивосток, ул Адмирала Горшкова, 3";
  String Room;
  final controller = TextEditingController();
  DateTime date = DateTime.now();

  List<ListItem> _dropdownItems = [
    ListItem(1, "Владивосток, ул Адмирала Горшкова, 3"),
    ListItem(2, "Владивосток, ул Адмирала Кузнецова, 64А"),
    ListItem(3, "Владивосток, ул Борисенко, 31"),
    ListItem(4, "Владивосток, ул Кирова, 66"),
    ListItem(5, "Владивосток, ул Крыгина, 19"),
    ListItem(6, "Владивосток, ул Можайская, 1Б"),
    ListItem(7, "Владивосток, ул Приморская, 6"),
    ListItem(8, "Владивосток, ул Светланская, 105"),
    ListItem(9, "Владивосток, ул ул Спортивная, 11"),
    ListItem(10, "Владивосток, ул Уборевича, 14"),
    ListItem(11, "Владивосток, ул Уборевича, 30/37"),
    ListItem(12, "Владивосток, ул Черёмуховая, 11"),
    ListItem(13, "Владивосток, ул 50 лет ВЛКСМ, 17"),
    ListItem(14, "Дальнереченск, ул Калинина, 72"),
    ListItem(15, "Дальнереченск, ул Ленина, 34"),
    ListItem(16, "Дальнереченск, ул Пушкина, 17А"),
    ListItem(17, "Дальнереченск, ул Фадеева, 70А"),
    ListItem(18, "Дальнереченск, ул Фадеева, 70В"),
    ListItem(19, "Дальнереченск, ул Фадеева, 70"),
    ListItem(20, "Леслзаводск, ул Калининская, 48"),
    ListItem(21, "Лесозаводск, ул Куйбышева, 7"),
    ListItem(22, "Лесозаводск, ул Октябрьская, 84"),
    ListItem(23, "Лесозаводск, ул Пушкинская, дом 38"),
    ListItem(24, "Лесозаводск, ул Пушкинская, дом 50"),
    ListItem(25, "Лесозаводск, ул Степная, 3"),
    ListItem(26, "Лесозаводск, ул 9 Января, 102А"),
    ListItem(27, "Лесозаводск, ул 9 Января, 102А1"),
    ListItem(28, "Лесозаводск, ул 9 Января, 102А2"),
    ListItem(28, "Лесозаводск, ул 9 Января, 102Б"),
    ListItem(29, "Лесозаводск, ул 9 Января, 102В"),
    ListItem(30, "Лесозаводск, с. Пантелеймоновка, ул Центральная, 58а"),
    ListItem(31, "п. Раздольное, ул Котовского, 1Г"),
    ListItem(32, "п. Новый, ул Ленина, 12"),
    ListItem(33, "п. Новый, ул Ленина, 13"),
    ListItem(34, "п. Тавричанка, ул Лазо, 3"),
    ListItem(35, "с. Вольно-Надеждинское, ул Железнодорожная, 9Б"),
    ListItem(36, "с. Вольно-Надеждинское, ул Пушкина, 61"),
    ListItem(37, "с. Вольно-Надеждинское, ул Пушкина, 61В"),
    ListItem(38, "с. Вольно-Надеждинское, ул Р.Дрегиса, 9"),
    ListItem(39, "Партизанск, ул Вахрушева, 6"),
    ListItem(40, "Партизанск, ул Индустриальная, 20"),
    ListItem(41, "Партизанск, ул Лазо, 4"),
    ListItem(42, "Партизанск, ул Ленинская, 28"),
    ListItem(43, "Партизанск, ул Ленинская, 28А"),
    ListItem(44, "Партизанск, ул Ленинская, 30"),
    ListItem(45, "Партизанск, ул Ленинская, 45"),
    ListItem(46, "Партизанск, ул Павла Разгонова, 37"),
    ListItem(47, "Партизанск, ул Щорса, 20"),
    ListItem(48, "Партизанск, ул 50 лет ВЛКСМ, 28"),
    ListItem(49, "Партизанск, с. Авангард, ул Кирова, 33"),
    ListItem(50, "Партизанск, с. Авангард, ул Кирова, 39А"),
    ListItem(51, "Партизанск, с. Углекаменск, п Больничный, 12А"),
    ListItem(52, "Партизанск, с. Углекаменск, ул Калинина, 2"),
    ListItem(53, "Партизанск, с. Углекаменск, ул Калинина, 2А"),
    ListItem(54, "Спасск-Дальний, ул Дербенёва, 21"),
    ListItem(55, "Спасск-Дальний, ул Дербенёва, 23А"),
    ListItem(56, "Спасск-Дальний, ул Красногвардейская, 95А"),
    ListItem(57, "Спасск-Дальний, ул Ленинская, 29"),
    ListItem(58, "Спасск-Дальний, п Мухинский, 6"),
    ListItem(59, "Спасск-Дальний, ул Парковая, 51"),
    ListItem(60, "Спасск-Дальний, ул Советская, 43"),
    ListItem(61, "с. Александровка, ул Партизанская, 54А"),
    ListItem(62, "с. Новосельское, ул Центральная, 3А"),
    ListItem(63, "с. Спасское, ул Хрещатинская, 68"),
    ListItem(64, "с. Чкаловское, ул Ленина, 96")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ввод данных'),
      ),
      body: SingleChildScrollView(
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
                        SizedBox(
                          width: 400,
                            child: DropdownButton<ListItem>(
                                value: _selectedItem,
                                items: _dropdownMenuItems,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedItem = value;
                                    Address = _selectedItem.name;
                                  });
                                }
                            ),
                        ),
                        TextFormField(
                          //controller: controller,
                          decoration: InputDecoration(
                              labelText: '№ кабинета'
                          ),
                          keyboardType: TextInputType.name,
                          onChanged: (String value) {
                            Room = value;
                          },
                          // validator: (String value) {
                          //   if (value.isEmpty) {
                          //     return 'Необходимо заполнить поле';
                          //   }
                          // },
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

                                },
                                child: Text("Сохранить",
                                    style: TextStyle(fontSize: 15)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              child: RaisedButton(
                                color: Colors.blue,
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        30.0)
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          QRViewExample(Address,Room," "," "," ", "")));
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
