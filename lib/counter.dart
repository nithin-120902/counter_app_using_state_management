// ignore_for_file: dead_code, prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends ChangeNotifier{
  int counter = 0;
  String answer = '0';

  void increment() async{
    try {
      answer="loading";
      notifyListeners();
      await Future.delayed(Duration(seconds: 1));
      counter++; 
      answer=counter.toString();
      //throw 'This is an error';
    } catch (e) {
      answer="Error";
    }
    notifyListeners();
  }

  void decrement() async{
    try {
      if (counter > 0) {
        answer = "loading";
        notifyListeners();
        await Future.delayed(Duration(seconds: 1));
        counter--;
        answer = counter.toString();
      } 
    } catch (e) {
      answer="Error" ;
    }
    notifyListeners();
  }

  void reset() async{
    try {
      answer = "loading";
      notifyListeners();
      await Future.delayed(Duration(seconds: 1));
      counter = 0;
      answer = counter.toString(); 
    } catch (e) {
      answer="Error";
    }
    notifyListeners();
  }
}
