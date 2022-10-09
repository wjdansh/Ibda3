// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:map/map.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:latlng/latlng.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
//
// class map extends StatefulWidget {
//   @override
//   _mapState createState() => _mapState();
// }
//
// class _mapState extends State<map> {
//   final controller = MapController(
//     zoom: 8,
//     location: LatLng(33.487, 36.3398), //LatLng(33.51, 36.27),
//   );
//   @override
//   void initState() {
//     _getUserLocation();
//     super.initState();
//   }
//
//   bool _darkMode = false;
//
//   final markers = [
//     LatLng(33.487, 36.3398),
//     // LatLng(35.676, 51.41),
//     LatLng(32.710, 36.569),
//     LatLng(32.853, 36.629),
//     // LatLng(35.682, 51.41),
//     //  LatLng(35.684, 51.41),
//     LatLng(34.89, 35.878),
//   ];
//   LatLng currentPostion;
//
//   _getUserLocation() async {
//     // var position = await GeolocatorPlatform.instance
//     //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//
//     // var position = await GeolocatorPlatform.instance
//     //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//
//     var position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//
//     while (position.longitude == null)
//       return Center(
//           child: SpinKitFadingCircle(
//         color: Theme.of(context).accentColor,
//       ));
//
//     setState(() {
//       currentPostion = // LatLng(position.altitude, position.accuracy);
//           LatLng(position.latitude, position.longitude);
//     });
//   }
//
//   //
//   void _gotoDefault() {
//     _getUserLocation();
//     controller.center = currentPostion;
//     //LatLng(33.51, 36.27);
//     setState(() {});
//   }
//
//   void _onDoubleTap() {
//     controller.zoom += 0.5;
//     setState(() {});
//   }
//
//   Offset _dragStart;
//   double _scaleStart = 1.0;
//   void _onScaleStart(ScaleStartDetails details) {
//     _dragStart = details.focalPoint;
//     _scaleStart = 1.0;
//   }
//
//   void _onScaleUpdate(ScaleUpdateDetails details) {
//     final scaleDiff = details.scale - _scaleStart;
//     _scaleStart = details.scale;
//
//     if (scaleDiff > 0) {
//       controller.zoom += 0.02;
//       setState(() {});
//     } else if (scaleDiff < 0) {
//       controller.zoom -= 0.02;
//       setState(() {});
//     } else {
//       final now = details.focalPoint;
//       final diff = now - _dragStart;
//       _dragStart = now;
//       controller.drag(diff.dx, diff.dy);
//       setState(() {});
//     }
//   }
//
//   Widget _buildMarkerWidget(Offset pos, Color color) {
//     return Positioned(
//       left: pos.dx - 16,
//       top: pos.dy - 16,
//       width: 24,
//       height: 24,
//       child: IconButton(
//         icon: Icon(
//           Icons.location_on,
//           color: color,
//         ),
//         iconSize: 35,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       // appBar: AppBar(
//       //   title: Text('Map Demo'),
//       //   actions: [
//       //     IconButton(
//       //       tooltip: 'Toggle Dark Mode',
//       //       onPressed: () {
//       //         setState(() {
//       //           _darkMode = !_darkMode;
//       //         });
//       //       },
//       //       icon: Icon(Icons.wb_sunny),
//       //     ),
//       //   ],
//       // ),
//       body: MapLayoutBuilder(
//         controller: controller,
//         builder: (context, transformer) {
//           final markerPositions =
//               markers.map(transformer.fromLatLngToXYCoords).toList();
//
//           final markerWidgets = markerPositions.map(
//             (pos) => _buildMarkerWidget(pos, Theme.of(context).primaryColor),
//           );
//
//           final homeLocation =
//               transformer.fromLatLngToXYCoords(LatLng(35.68, 51.412));
//           final CLocation = transformer.fromLatLngToXYCoords(currentPostion);
//           final homeMarkerWidget = _buildMarkerWidget(CLocation, Colors.red);
//
//           final centerLocation = Offset(
//               transformer.constraints.biggest.width / 2,
//               transformer.constraints.biggest.height / 2);
//
//           final centerMarkerWidget =
//               _buildMarkerWidget(centerLocation, Colors.yellow);
//
//           if (transformer == null) {
//             return Center(child: CircularProgressIndicator());
//           }
//           return GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onDoubleTap: _onDoubleTap,
//             onScaleStart: _onScaleStart,
//             onScaleUpdate: _onScaleUpdate,
//             onTapUp: (details) {
//               final location =
//                   transformer.fromXYCoordsToLatLng(details.localPosition);
//
//               final clicked = transformer.fromLatLngToXYCoords(location);
//
//               // print('${location.longitude}, ${location.latitude}');
//               // print('${clicked.dx}, ${clicked.dy}');
//               // print('${details.localPosition.dx}, ${details.localPosition.dy}');
//             },
//             child: Listener(
//               behavior: HitTestBehavior.opaque,
//               onPointerSignal: (event) {
//                 if (event is PointerScrollEvent) {
//                   final delta = event.scrollDelta;
//
//                   controller.zoom -= delta.dy / 1000.0;
//                   setState(() {});
//                 }
//               },
//               child: Stack(
//                 children: [
//                   Map(
//                     controller: controller,
//                     builder: (context, x, y, z) {
//                       //Legal notice: This url is only used for demo and educational purposes. You need a license key for production use.
//
//                       //Google Maps
//                       final url =
//                           'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';
//
//                       final darkUrl =
//                           'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i$z!2i$x!3i$y!4i256!2m3!1e0!2sm!3i556279080!3m17!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC52Om9uLHMuZTpsfHAudjpvZmZ8cC5zOi0xMDAscy5lOmwudC5mfHAuczozNnxwLmM6I2ZmMDAwMDAwfHAubDo0MHxwLnY6b2ZmLHMuZTpsLnQuc3xwLnY6b2ZmfHAuYzojZmYwMDAwMDB8cC5sOjE2LHMuZTpsLml8cC52Om9mZixzLnQ6MXxzLmU6Zy5mfHAuYzojZmYwMDAwMDB8cC5sOjIwLHMudDoxfHMuZTpnLnN8cC5jOiNmZjAwMDAwMHxwLmw6MTd8cC53OjEuMixzLnQ6NXxzLmU6Z3xwLmM6I2ZmMDAwMDAwfHAubDoyMCxzLnQ6NXxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjV8cy5lOmcuc3xwLmM6I2ZmNGQ2MDU5LHMudDo4MnxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjJ8cy5lOmd8cC5sOjIxLHMudDoyfHMuZTpnLmZ8cC5jOiNmZjRkNjA1OSxzLnQ6MnxzLmU6Zy5zfHAuYzojZmY0ZDYwNTkscy50OjN8cy5lOmd8cC52Om9ufHAuYzojZmY3ZjhkODkscy50OjN8cy5lOmcuZnxwLmM6I2ZmN2Y4ZDg5LHMudDo0OXxzLmU6Zy5mfHAuYzojZmY3ZjhkODl8cC5sOjE3LHMudDo0OXxzLmU6Zy5zfHAuYzojZmY3ZjhkODl8cC5sOjI5fHAudzowLjIscy50OjUwfHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE4LHMudDo1MHxzLmU6Zy5mfHAuYzojZmY3ZjhkODkscy50OjUwfHMuZTpnLnN8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmd8cC5jOiNmZjAwMDAwMHxwLmw6MTYscy50OjUxfHMuZTpnLmZ8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmcuc3xwLmM6I2ZmN2Y4ZDg5LHMudDo0fHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE5LHMudDo2fHAuYzojZmYyYjM2Mzh8cC52Om9uLHMudDo2fHMuZTpnfHAuYzojZmYyYjM2Mzh8cC5sOjE3LHMudDo2fHMuZTpnLmZ8cC5jOiNmZjI0MjgyYixzLnQ6NnxzLmU6Zy5zfHAuYzojZmYyNDI4MmIscy50OjZ8cy5lOmx8cC52Om9mZixzLnQ6NnxzLmU6bC50fHAudjpvZmYscy50OjZ8cy5lOmwudC5mfHAudjpvZmYscy50OjZ8cy5lOmwudC5zfHAudjpvZmYscy50OjZ8cy5lOmwuaXxwLnY6b2Zm!4e0&key=AIzaSyAOqYYyBbtXQEtcHG7hwAwyCPQSYidG8yU&token=31440';
//                       //Mapbox Streets
//                       // final url =
//                       //     'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/$z/$x/$y?access_token=YOUR_MAPBOX_ACCESS_TOKEN';
//
//                       return CachedNetworkImage(
//                         imageUrl: _darkMode ? darkUrl : url,
//                         fit: BoxFit.cover,
//                       );
//                     },
//                   ),
//                   homeMarkerWidget,
//                   ...markerWidgets,
//                   //   centerMarkerWidget,
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:
//             //_getUserLocation,
//             _gotoDefault,
//         tooltip: 'My Location',
//         child: Icon(Icons.my_location),
//       ),
//     );
//   }
// }
