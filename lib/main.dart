// imports
import 'package:flutter/material.dart';

// etapa 1 - esqueleto da tela
// objetivo: enteder a estrutura de um app Flutter

void main() => runApp(MaterialApp(
  home: gasolinaApp(),
));

class gasolinaApp extends StatelessWidget{

  String _resultado = "";
  void _calcular(){

      

  }
  @override 
    Widget build(BuildContext context){
      // esqueleto visual da tela - como a tag <HTML>
      return Scaffold( 
        // local onde ficará a maioria dos nossos elementos

        // semelhante ao Header
        appBar: AppBar(
          title: Text("Calculador de gasolina"),
        ),

        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // aqui é onde estarão os nossos elementos/widgets

              Text(
                "Bem-vindo à Calculadora de gasolina!",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
               Text(
                "Informe o valor do combustível",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 16),

              // campos de texto
              TextField(
                decoration: InputDecoration(
                  labelText: "Valor do Etanol:",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              TextField(
                decoration: InputDecoration(
                  labelText: "Valor da Gasolina:",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: _calcular,
                child: Text("Calcular"),
              ),
              SizedBox(height: 36),
              Text(
                _resultado, 
                style:TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )
              
            ], // Children
          ),
        ),
      );
    } // Context
} // Extends StatelessWidget
