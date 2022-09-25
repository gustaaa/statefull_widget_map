import 'package:flutter/material.dart';
import 'package:statefull_widget_map/widget/Convert.dart';
import 'package:statefull_widget_map/widget/Input.dart';
import 'package:statefull_widget_map/widget/Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double _inputUser = 0;
  double _result = 0;
  String selected = '';

  var listSatuanSuhu = ["kelvin", "reamur"];
  List<String> listHasil = [];
  konversiSuhu() {
    setState(() {
      print(listHasil.length);
      _inputUser = double.parse(etInput.text);
      switch (selected) {
        case "kelvin":
          {
            // statements;
            _result = _inputUser + 273;
            listHasil.add("Konversi dari : " +
                "$_inputUser" +
                " ke " +
                "$_result" +
                " Kelvin");
          }
          break;
        case "reamur":
          {
            //statements;
            _result = _inputUser * 4 / 5;
            listHasil.add("Konversi dari : " +
                "$_inputUser" +
                " ke " +
                "$_result" +
                " Reamur");
          }
          break;
      }
    });
  }

  //DropdownMenuItem(String value) {
  // setState(() {
  //  selectedDropdown = value;
  // });
  //}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Input(etInput: etInput),
                //3 buat dropdown biasa
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      hintText: 'Choose Temperature',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 14,
                      )),
                  items: listSatuanSuhu.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    selected = value!;
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Result(
                        result: _result,
                      ),
                    ],
                  ),
                ),
                Convert(konvertHandler: konversiSuhu),
                Expanded(
                  child: ListView.builder(
                    itemCount: listHasil.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Text(listHasil[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
