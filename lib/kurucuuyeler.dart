import 'package:flutter/material.dart';
import 'package:news_app1/helper/kurucukart.dart';

List<String> kurucular = [
  "Nihat Yılmaz ŞİMŞEK",
];

class KurucuUyeler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kurucu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(33.0),
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: kurucular.length,
          itemBuilder: (BuildContext context, int pozisyon) {
            return KurucuKart(
              kurucu: kurucular[pozisyon],
            );
          },
        ),
      ),
    );
  }
}
