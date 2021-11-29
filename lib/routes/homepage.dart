import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_finder/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    // _getCurrentLocation();
  }

  // gets current location position and prints to the console
  // Future<void> _getCurrentLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   print(position);
  // }

// gets current position when you start the app
  Future<void> _mapOpened(GoogleMapController controller) async {
    _controller.complete(controller);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 20,
          target: LatLng(
            position.latitude,
            position.longitude,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    // ignore: unnecessary_statements
    SizeConfig.mediaQueryData;
    String maps = 'assets/svg/maps.svg';
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     Icon(
      //       Icons.map,
      //       color: Colors.black,
      //     )
      //   ],
      // ),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onMapCreated: _mapOpened,
            initialCameraPosition:
                CameraPosition(target: LatLng(6.5894, 3.3614), zoom: 15),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: getPropScreenHeight(20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: getPropScreenHeight(95),
                    width: getPropScreenWidth(676),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: TextFormField(
                        obscureText: false,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        style: GoogleFonts.poppins(
                            color: Color(0xff444444),
                            fontSize: getPropScreenWidth(36),
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            height: getPropScreenHeight(56),
                            width: getPropScreenWidth(38),
                            child: SvgPicture.asset(
                              maps,
                              fit: BoxFit.contain,
                            ),
                          ),
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  FeatherIcons.mic,
                                  size: getPropScreenWidth(42),
                                  color: Color(0xff3C4043),
                                ),
                              ),
                              CircleAvatar(
                                radius: getPropScreenWidth(35),
                                backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/69363693?v=4"),
                                backgroundColor: Colors.transparent,
                              )
                            ],
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Search here',
                          hintStyle: GoogleFonts.poppins(
                              color: Color(0xff83878A),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
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
