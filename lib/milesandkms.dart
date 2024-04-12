import "package:flutter/material.dart";

class MilesAndKms extends StatefulWidget {
  @override
  _MilesAndKmsState createState() => _MilesAndKmsState();
}

class _MilesAndKmsState extends State<MilesAndKms> {
  TextEditingController _inputController = TextEditingController();
  String _result = '';
  String? _selectedConversion; // Changed to nullable
  List<String> _conversionOptions = ['Miles to Kilometers', 'Kilometers to Miles'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Miles And Kms"),
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
            SizedBox(height: 20,),
ElevatedButton(
  onPressed: _convertUnits,
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.amber,
    padding: EdgeInsets.symmetric(vertical: 20), // Adjust the button's padding
    minimumSize: Size(double.infinity, 50), // Adjust the button's minimum size
  ),
  child: Text('Convert',style:TextStyle(color: Colors.black),),
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
    if (_selectedConversion == 'Miles to Kilometers') {
      convertedValue = inputValue * 1.60934; // Conversion from miles to kilometers
      setState(() {
        _result = '$inputValue miles is equal to $convertedValue kilometers';
      });
    } else {
      convertedValue = inputValue / 1.60934; // Conversion from kilometers to miles
      setState(() {
        _result = '$inputValue kilometers is equal to $convertedValue miles';
      });
    }
  }
}