import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor:Color(0xffB67E3A),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'height in cm',
                icon: Icon(Icons.height),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'weight in kg',
                icon: Icon(Icons.monitor_weight),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:Color(0xffA973EC)),
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: calculateBMI,
            ),
            SizedBox(height: 15),
            Text(
              _result == null ? "Enter Value" : "${_result?.toStringAsFixed(2)}",
              style: TextStyle(
                color: Color(0xff0261AF),
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    setState(() {});
  }
}

