import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Iletisim extends StatefulWidget {
  @override
  _IletisimState createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {
  Completer<GoogleMapController> _haritaHazirlayici =
      Completer<GoogleMapController>();

  Map<MarkerId, Marker> _isaretler = <MarkerId, Marker>{};

  Future _linkeGit(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      debugPrint('linki açamıyorum');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İletişim'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300.0,
            width: double.maxFinite,
            child: GoogleMap(
              mapType: MapType.normal,
              markers: Set<Marker>.of(_isaretler.values),
              initialCameraPosition: CameraPosition(
                target: LatLng(37.0074757, 37.4343301),
                zoom: 17.0,
              ),
              onMapCreated: (GoogleMapController controller) {
                final MarkerId isaretId = MarkerId('merkez');
                final Marker isaret = Marker(
                  markerId: isaretId,
                  position: LatLng(37.0074757, 37.4343301),
                  infoWindow: InfoWindow(
                    title: 'YOUDEVO',
                    snippet: 'Hasan Kalyoncu Üniversitesi',
                    onTap: () {
                      debugPrint('Tıklandı');
                    },
                  ),
                );

                _isaretler[isaretId] = isaret;
                _haritaHazirlayici.complete(controller);
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.home,
                        size: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                    child: Text(
                      'Hasan Kalyoncu Üniversitesi/GAZİANTEP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          _linkeGit('tel:+900000000000');
                        },
                        child: Icon(
                          FontAwesomeIcons.phone,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                    child: Text(
                      '00000000000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          _linkeGit('mailto:info@youdevo.com');
                        },
                        child: Icon(
                          FontAwesomeIcons.envelope,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                    child: Text(
                      'info@youdevo.com',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
