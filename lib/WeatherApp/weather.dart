import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:updapp/Attributes/const_text_field.dart';
import 'package:updapp/Attributes/container_decoration.dart';
import 'package:updapp/Attributes/main_drawer.dart';
import 'package:updapp/Attributes/whole_background.dart';

class Weather extends StatefulWidget {
  
  Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  double? Dsicaklik;
  var konum;
  var sehirAdi = "Konya";
  int? Isicaklik;
  var hava;
  late TextEditingController _havacontrol;

  Future<void> getSehir() async{
    konum = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$sehirAdi&units=metric&appid=7eb47f074cf7ad503e2405454d6b1122"));
    var konumParse = jsonDecode(konum.body);
    sehirAdi=konumParse["name"];
  }

  Future<void> getSicaklik()async{
    var konumsicaklik = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$sehirAdi&units=metric&appid=7eb47f074cf7ad503e2405454d6b1122"));
    var ksicaklikP = jsonDecode(konumsicaklik.body);
    setState(() {
      Dsicaklik = ksicaklikP["main"]["temp"];
    });
    Isicaklik=Dsicaklik!.round();
  }

  Future<void> getHava()async{
    var havaUrl = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$sehirAdi&units=metric&appid=7eb47f074cf7ad503e2405454d6b1122"));
    var havaParse = jsonDecode(havaUrl.body);
    setState(() {
      hava = havaParse["weather"][0]["main"];
    });
  }

  @override
  void initState() {
    _havacontrol = TextEditingController();
    getDataFromAPI();
        super.initState();
  }

  @override
  void dispose() {
    _havacontrol.dispose();
    super.dispose();
  }

  Future<void> getDataFromAPI() async {
    await getSehir();
    getSicaklik();
    getHava();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        drawer: MainDrawer(context),
        appBar: AppBar(backgroundColor: Colors.deepPurple.withOpacity(0.6),
          actions: [
            IconButton(onPressed: (){
              setState(() {
                _havacontrol.text != ""?
                (sehirAdi = _havacontrol.text):
                    sehirAdi="Konya";
                getDataFromAPI();

              });

            }, icon: Icon(Icons.save))
          ],
        ),
        body: BackG(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Flexible(child: Container(
                      margin: EdgeInsets.all(10),
                      child: ConstTextField(EdgeInsets.all(10),controller: _havacontrol),
                      decoration: ConstDecoration(radiuscondition: true, radius: 30,color: Colors.black87),
                    ),flex: 1,),

                    Flexible(child:Container(
                      child: Column(
                        children: [
                          Text(" $sehirAdi",style: TextStyle(fontSize: 20),),
                          DrawerElement(icon: FontAwesomeIcons.temperatureHalf,text: "$Isicaklik"),
                          DrawerElement(icon: FontAwesomeIcons.cloudSun,text: "$hava")
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      decoration: ConstDecoration(radiuscondition: true,radius: 30,color: Colors.grey,),
                    ),flex: 7,)
                  ],
                ),
                decoration: ConstDecoration(color: Colors.white, radiuscondition: true, radius: 30),
                constraints: const BoxConstraints.expand(),
              ),
            ))
      ),
    );
  }
}

