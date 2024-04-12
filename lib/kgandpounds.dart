import 'package:flutter/material.dart';

class KgAndPounds extends StatefulWidget {
  @override
  _KgAndPoundsState createState() => _KgAndPoundsState();
}

class _KgAndPoundsState extends State<KgAndPounds> {
  TextEditingController _inputController = TextEditingController();
  String _result = '';
  String? _selectedConversion; // Changed to nullable
  List<String> _conversionOptions = ['Kilograms to Pounds', 'Pounds to Kilograms'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Kgs And Pounds'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedConversion,
              onChanged: (String? newValue) { // Changed parameter type to String?
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
            SizedBox(height: 20.0),
ElevatedButton(
  onPressed: _convertUnits,
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.amber,
    padding: EdgeInsets.symmetric(vertical: 20), // Adjust the button's padding
    minimumSize: Size(double.infinity, 50), // Adjust the button's minimum size
  ),
  child: Text('Convert',style: TextStyle(color: Colors.black),),
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
    if (_selectedConversion == null) return; // Added null check
    double inputValue = double.tryParse(_inputController.text) ?? 0.0;
    double convertedValue;
    if (_selectedConversion == 'Kilograms to Pounds') {
      convertedValue = inputValue * 2.20462; // Conversion from kilograms to pounds
      setState(() {
        _result = '$inputValue kilograms is equal to $convertedValue pounds';
      });
    } else {
      convertedValue = inputValue / 2.20462; // Conversion from pounds to kilograms
      setState(() {
        _result = '$inputValue pounds is equal to $convertedValue kilograms';
      });
    }
  }
}
