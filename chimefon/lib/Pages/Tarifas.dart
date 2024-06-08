import 'package:flutter/material.dart';

class Tarifas extends StatefulWidget {
  @override
  _TarifasState createState() => _TarifasState();
}

class _TarifasState extends State<Tarifas> {
  final TextEditingController _tiempoController = TextEditingController();
  final TextEditingController _tipoDiaController = TextEditingController();
  final TextEditingController _turnoController = TextEditingController();
  double _pagoTiempo = 0.0;
  double _impuesto = 0.0;
  double _totalPagar = 0.0;
  bool _mostrarTotal = false;

  void _calcularTarifa() {
    int tiempo = int.parse(_tiempoController.text);
    String tipoDia = _tipoDiaController.text.toLowerCase();
    String turno = _turnoController.text.toLowerCase();

    int minutos5 = tiempo > 5 ? 5 : tiempo;
    int minutos3 = tiempo > 8 ? 3 : (tiempo > 5 ? tiempo - 5 : 0);
    int minutos2 = tiempo > 10 ? 2 : (tiempo > 8 ? tiempo - 8 : 0);
    int minutos50 = tiempo > 10 ? tiempo - 10 : 0;

    _pagoTiempo = (minutos5 * 1.0) +
        (minutos3 * 0.8) +
        (minutos2 * 0.7) +
        (minutos50 * 0.5);

    if (tipoDia == 'domingo') {
      _impuesto = _pagoTiempo * 0.03;
    } else if (_esDiaHabil(tipoDia) && turno == 'matutino') {
      _impuesto = _pagoTiempo * 0.15;
    } else if (_esDiaHabil(tipoDia) && turno == 'vespertino') {
      _impuesto = _pagoTiempo * 0.1;
    }

    _totalPagar = _pagoTiempo + _impuesto;
    _mostrarTotal = true;
    setState(() {}); // Aquí se agrega esta línea
  }

  bool _esDiaHabil(String dia) {
    List<String> diasHabiles = [
      'lunes',
      'martes',
      'miercoles',
      'jueves',
      'viernes',
      'sabado'
    ];
    return diasHabiles.contains(dia);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHIMEFON'),
        backgroundColor: Color(0xFFFF4D94),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tiempoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tiempo (minutos)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            TextField(
              controller: _tipoDiaController,
              decoration: InputDecoration(
                labelText: 'Tipo de día',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            TextField(
              controller: _turnoController,
              decoration: InputDecoration(
                labelText: 'Turno',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calcularTarifa, // Aquí se llama a _calcularTarifa
              child: Text('Calcular'),
              style: ElevatedButton.styleFrom(),
            ),
            SizedBox(height: 16.0),
            Text('Pago por el tiempo: \$${_pagoTiempo.toStringAsFixed(2)}'),
            Text('Impuesto: \$${_impuesto.toStringAsFixed(2)}'),
            if (_mostrarTotal)
              Text('Total a pagar: \$${_totalPagar.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
