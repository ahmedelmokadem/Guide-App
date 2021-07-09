import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class map extends StatefulWidget {
  map({Key key, this.lat , this.long,this.snip}) : super(key: key);
  double lat ;
  double long ;
  String snip;

  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  double lat1,lat2,long1,long2;
  double res=0.0;
  String r;
  var myMarkers = HashSet<Marker>();  // collection
  Completer<GoogleMapController> controller=Completer();
  Position position;
  List<Polyline> myPolyline=[];
  Future getPos()async{
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  createPolyline() {
    lat2=30.080738;
    long2= 31.219346;
    lat1=position.latitude;
    long1=position.longitude;

    myPolyline.add(
      Polyline(
          polylineId: PolylineId('1'),
          color : Colors.grey,
          width: 3,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap,
          visible: true,
          points: [
            LatLng(position.latitude, position.longitude),
            LatLng(lat2,long2),
          ]

      ),
    );
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }


  @override
  Widget build(BuildContext context) {
    int i=0;
    Size s =MediaQuery.of(context).size;
    double h=s.height,w=s.width;
    return Scaffold(
      //  backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getPos(),
          builder: (context, snapshot) {
            if (position == null) {
              return Container();
            }
            else {
              return Stack(
                  children:
                  [
                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(widget.lat, widget.long),
                          zoom: 13.8),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController cont) {
                        controller.complete(cont);
                        setState(() {
                          createPolyline();
                          res=_coordinateDistance(lat1, long1, lat2, long2);
                          r=res.toString();
                          r=r.substring(0,3);
                              myMarkers.add(
                                Marker(
                                  markerId: MarkerId("2"),
                                  position: LatLng(widget.lat, widget.long),
                                  infoWindow: InfoWindow(
                                    title: widget.snip,
                                  ),
                                ),
                              );

                        });
                      },
                      markers: myMarkers,
                      polylines: myPolyline.toSet(),
                    ),


                  ]

              );
            }
          }
      ),

    );
  }
}

