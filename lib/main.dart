import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: gasolinaApp(),
));

class gasolinaApp extends StatefulWidget {
  @override
  _gasolinaAppState createState() => _gasolinaAppState();
}

class _gasolinaAppState extends State<gasolinaApp> {

  final TextEditingController _etanolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();

  String _resultado = "";

static const Color corFundo = Color(0xFF121212);      
static const Color corCard = Color(0xFF1E1E1E);       
static const Color corPrimaria = Color(0xFFD32F2F);   
static const Color corSecundaria = Color(0xFFFFC107); 
static const Color corTexto = Color(0xFFFFFFFF);      
static const Color corTextoCinza = Color(0xFFB0B0B0); 
static const Color corBorda = Color(0xFF2C2C2C);

  void _calcular() {
    final double etanol = double.tryParse(_etanolController.text) ?? 0;
    final double gasolina = double.tryParse(_gasolinaController.text) ?? 0;

    // Validação
    if (etanol <= 0 || gasolina <= 0) {
      setState(() {
        _resultado = 'Informe valores válidos para os combustíveis';
      });
      return;
    }

    
    final double resultado = etanol / gasolina;

  
    String melhorOpcao;
    if (resultado <= 0.7) {
      melhorOpcao = 'Etanol';
    } else {
      melhorOpcao = 'Gasolina';
    }

    setState(() {
      _resultado =
          'O coeficiente é: ${resultado.toStringAsFixed(2)}\n'
          'Melhor opção: $melhorOpcao';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo,

      appBar: AppBar(
        backgroundColor: corCard,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Calculadora de combustível",
          style: TextStyle(
            color: corSecundaria,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(height: 16),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: corCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: corBorda),
              ),
              child: Text(
                "Informe os preços dos combustíveis",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: corTextoCinza,
                ),
              ),
            ),

            SizedBox(height: 24),

            _buildCampo(
              controller: _etanolController,
              label: 'Preço do etanol',
              icone: Icons.eco,
            ),

            SizedBox(height: 16),

            _buildCampo(
              controller: _gasolinaController,
              label: 'Preço da gasolina',
              icone: Icons.local_gas_station,
            ),

            SizedBox(height: 24),

            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: corPrimaria,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                "CALCULAR",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 30),

            if (_resultado.isNotEmpty)
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: corCard,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: corBorda),
                ),
                child: Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: corTexto,
                    fontSize: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampo({
    required TextEditingController controller,
    required String label,
    required IconData icone,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(color: corTexto),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: corTextoCinza),
        prefixIcon: Icon(icone, color: corPrimaria),
        filled: true,
        fillColor: corCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}