import 'package:flutter/material.dart';

class YanMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.0),
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[Colors.white])),
              child: Container(
                child: Column(
                  children: <Widget>[],
                ),
              ),
            ),
            //PROFİL
            ExpansionTile(
              leading: Icon(Icons.account_box),
              title: Text('Hakkımızda'),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: ListTile(
                    leading: Icon(Icons.supervised_user_circle),
                    title: Text('Kurucu Üyeler'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/kurucuuyeler');
                    },
                  ),
                )
              ],
            ),
            Divider(
              height: 1.0,
              color: Colors.blueGrey,
            ),

            Divider(
              height: 1.0,
              color: Colors.blueGrey,
            ),
            //İLETİŞİM
            ListTile(
              leading: Icon(
                Icons.contact_phone,
              ),
              title: Text(
                'İletişim',
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/iletisim');
              },
            ),
            Divider(
              height: 1.0,
              color: Colors.blueGrey,
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
              ),
              title: Text(
                'Çıkış Yap',
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              },
            ),
            Divider(
              height: 1.0,
              color: Colors.blueGrey,
            )
          ],
        ),
      ),
    );
  }
}
