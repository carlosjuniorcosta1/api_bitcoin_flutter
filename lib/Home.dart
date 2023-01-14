import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
  

}

class _HomeState extends State<Home> {

  String _precoCompraBrasil = "";
  String _precoVendaBrasil = "";

  _pegarCotacao() async {

String url = "https://blockchain.info/ticker";
http.Response response;
response = await http.get(Uri.parse(url));
Map<String, dynamic> retorno = json.decode(response.body);

String precoCompra = retorno['BRL']['buy'].toString();
String precoVenda = retorno['BRL']['sell'].toString();


setState(() {
 _precoCompraBrasil = precoCompra;
  _precoVendaBrasil = precoVenda;

});



  }




  @override

  Widget build(BuildContext context) {
    return Scaffold(
           body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset('images/bitcoin.png'),
                 Padding(padding: EdgeInsets.only(top: 20)),
                 Text("Compra: ${_precoCompraBrasil}", style: TextStyle(fontSize: 24,)),

                 Padding(padding: EdgeInsets.only(top: 20)),
                 ElevatedButton(onPressed: (){

                   _pegarCotacao();




                 }, child: Text("Atualizar" ),
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.orange,
                   foregroundColor: Colors.white,
                   textStyle: TextStyle(fontSize: 25),
                   padding: EdgeInsets.all(10),

                 ),),
               ],
             ),


      ),
    );
  }
}



