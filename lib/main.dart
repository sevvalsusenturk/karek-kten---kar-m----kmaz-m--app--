import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(SquareRootCalculatorApp());
}

class SquareRootCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        hintColor: Colors.pinkAccent,
        fontFamily: 'Roboto', // Özel yazı tipi eklemek için assets'e yazı tipinizi ekleyebilirsiniz.
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Karekök Hesaplayıcı'),
        ),
        body: SquareRootCalculator(),
      ),
    );
  }
}

class SquareRootCalculator extends StatefulWidget {
  @override
  _SquareRootCalculatorState createState() => _SquareRootCalculatorState();
}

class _SquareRootCalculatorState extends State<SquareRootCalculator> {
  TextEditingController _controller = TextEditingController();
  String result = '';

  void calculateSquareRoot() {
    String inputText = _controller.text.trim();
    if (inputText.isNotEmpty) {
      try {
        double number = double.parse(inputText);
        double squareRoot = sqrt(number);
        if (squareRoot % 1 == 0) {
          result = 'Cevap: ${squareRoot.toInt()}';
        } else {
          result = 'Cevap: Karekökten tam olarak çıkmıyor.';
        }
      } catch (e) {
        result = 'Hata: Geçersiz giriş.';
      }
    } else {
      result = 'Hata: Lütfen bir sayı girin.';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                labelText: 'Sayıyı Girin',
                labelStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: calculateSquareRoot,
            style: ElevatedButton.styleFrom(
              primary: Colors.pink,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(fontSize: 18),
            ),
            child: Text('Hesapla'),
          ),
          SizedBox(height: 20),
          Text(
            result,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
