import 'package:flutter/material.dart';

class UnitConverterPage extends StatefulWidget {
  @override
  Unitconverter createState() => Unitconverter();
}

class Unitconverter extends State<UnitConverterPage> {
  TextEditingController _inputController = TextEditingController();
  String _result = '';
  String? _selectedConversion;
  List<String> _conversionOptions = [
    'Miles to Kilometers',
    'Kilograms to Pounds',
    'Inches to Centimeters',
    'Fahrenheit to Celsius',
    'Liquid Gallons to Liters'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMPERIAL TO METRIC'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedConversion,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedConversion = newValue;
                });
              },
              items: _conversionOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter value',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertUnits,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 20),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Convert', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 20.0),
            Text(
              _result,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  void _convertUnits() {
    if (_selectedConversion == null) return;
    double inputValue = double.tryParse(_inputController.text) ?? 0.0;
    double convertedValue;

    switch (_selectedConversion) {
      case 'Miles to Kilometers':
        convertedValue = inputValue * 1.60934;
        setState(() {
          _result = '$inputValue miles is equal to $convertedValue kilometers';
        });
        break;
      case 'Kilograms to Pounds':
        convertedValue = inputValue * 0.453592;
        setState(() {
          _result = '$inputValue kilograms is equal to $convertedValue pounds';
        });
        break;
      case 'Inches to Centimeters':
        convertedValue = inputValue * 2.54;
        setState(() {
          _result = '$inputValue inches is equal to $convertedValue centimeters';
        });
        break;
      case 'Fahrenheit to Celsius':
        convertedValue = (inputValue - 32) * 5 / 9;
        setState(() {
          _result = '$inputValue Fahrenheit is equal to $convertedValue Celsius';
        });
        break;
      case 'Liquid Gallons to Liters':
        convertedValue = inputValue * 3.78541;
        setState(() {
          _result = '$inputValue liquid gallons is equal to $convertedValue liters';
        });
        break;
    }
  }
}
