import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20), // Add some spacing between app bar and buttons
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/miles_and_kms'); // Navigate to MilesAndKms screen
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20),
              backgroundColor: Colors.amber // Adjust the button's padding
            ),
            child: Text(
              'Miles and Kilometers',
              style: TextStyle(fontSize: 20,color: Colors.black), // Adjust the button's text size
            ),
          ),
          SizedBox(height: 20), // Add some spacing between app bar and buttons
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/kg_to_pounds'); // Navigate to KgAndPounds screen // Navigate to MilesAndKms screen
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20),
              backgroundColor: Colors.amber // Adjust the button's padding
            ),
            child: Text(
              'Kgs and Pounds',
              style: TextStyle(fontSize: 20,color: Colors.black), // Adjust the button's text size
            ),
          ),
          
        ],
      ),
    );
  }
}
