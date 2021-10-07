import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_end/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_end/view/sign_in.dart';
import 'package:project_end/view/sign_up.dart';

import 'package:project_end/view/Welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: SignUp(),
      // home: WelcomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Map Google
  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  //SignIn
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Signin()),
          (Route<dynamic> route) => false);
    }
  }
//   @override
//   void initState() {
//     super.initState();
//     rubbersCoords.forEach((element) {
//       allMarkers.add(Marker(
//           markerId: MarkerId(element.name),
//           draggable: false,
//           infoWindow: InfoWindow(title: element.name, snippet: element.address),
//           position: element.locationCoords));

//     });
//     _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
//       ..addListener(_onScroll);
//   }

//   void _onScroll() {
//     if (_pageController.page.toInt() != prevPage) {
//       prevPage = _pageController.page.toInt();
//       moveCamera();
//     }
//   }

//   _rubberCoordsList(index) {
//     return AnimatedBuilder(
//       animation: _pageController,
//       builder: (BuildContext context, Widget widget) {
//         double value = 1;
//         if (_pageController.position.haveDimensions) {
//           value = _pageController.page - index;
//           value = (1 - (value.abs() * 0.3) + 0.66).clamp(0.0, 1.0);
//         }
//         return Center(
//           child: SizedBox(
//             height: Curves.easeInOut.transform(value) * 125.0,
//             width: Curves.easeInOut.transform(value) * 350.0,
//             child: widget,
//           ),
//         );
//       },
//       child: InkWell(
//         onTap: () {
//           // moveCamera();
//         },
//         child: Stack(
//           children: [
//             Center(
//               child: Container(
//                 margin: EdgeInsets.symmetric(
//                   horizontal: 10.0,
//                   vertical: 20.0,
//                 ),
//                 height: 125.0,
//                 width: 275.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black54,
//                       offset: Offset(0.0, 4.0),
//                       blurRadius: 10.0,
//                     ),
//                   ],
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: Colors.white,
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 90.0,
//                         width: 90.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(10.0),
//                             topLeft: Radius.circular(10.0),
//                           ),
//                           image: DecorationImage(
//                               image:
//                                   NetworkImage(rubbersCoords[index].thumbNail),
//                               fit: BoxFit.cover),
//                         ),
//                       ),
//                       SizedBox(width: 5.0),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             rubbersCoords[index].name,
//                             style: TextStyle(
//                                 fontSize: 12.5, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             rubbersCoords[index].address,
//                             style: TextStyle(
//                                 fontSize: 12.0, fontWeight: FontWeight.w600),
//                           ),
//                           Container(
//                             width: 170.0,
//                             child: Text(
//                               rubbersCoords[index].description,
//                               style: TextStyle(
//                                   fontSize: 11.0, fontWeight: FontWeight.w300),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height - 50.0,
//             width: MediaQuery.of(context).size.width,
//             child: GoogleMap(
//               initialCameraPosition: CameraPosition(
//                   target: LatLng(14.819019, 105.472635), zoom: 12.0),
//               markers: Set.from(allMarkers),
//               onMapCreated: mapCreated,
//             ),
//           ),
//           Positioned(
//             child: Container(
//               height: 200.0,
//               width: MediaQuery.of(context).size.width,
//               child: PageView.builder(
//                   controller: _pageController,
//                   itemBuilder: (BuildContext context, int index) {
//                     return _rubberCoordsList(index);
//                   }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void mapCreated(controller) {
//     setState(() {
//       _controller = controller;
//     });
//   }

//   moveCamera() {
//     _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         target: rubbersCoords[_pageController.page.toInt()].locationCoords,
//         zoom: 14.0,
//         bearing: 45.0,
//         tilt: 45.0)));
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => Signin()),
                  (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(child: Text("Main Page")),
    );
  }
}
