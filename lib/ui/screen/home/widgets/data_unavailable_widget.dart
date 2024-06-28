import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

import '../cubit/home_cubit.dart';

class DataUnavailableWidget extends StatelessWidget {
  final DataUnavailableReason dataUnavailableReason;

  const DataUnavailableWidget({super.key, required this.dataUnavailableReason});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, ((MediaQuery.of(context).size.height-350)/2).abs(), 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/error.svg',
            fit: BoxFit.contain,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 16),
          Text(
            dataUnavailableReason == DataUnavailableReason.noInternetAndCache?
            getErrorText()['noLocalData'] :
            dataUnavailableReason == DataUnavailableReason.locationPermissionDenied?
            getErrorText()['noLocationPermission'] :
            getErrorText()['locationNotEnabled'],
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            style: TextButton.styleFrom(),
            onPressed: () async {
              if(dataUnavailableReason == DataUnavailableReason.noInternetAndCache) {
                context.read<HomeCubit>().getCurrentWeather();
              } else if(dataUnavailableReason == DataUnavailableReason.locationPermissionDenied) {
                await Geolocator.openAppSettings();
              }else {
                await Geolocator.openLocationSettings();
              }
            },
            child: Text(
              dataUnavailableReason == DataUnavailableReason.noInternetAndCache?
              getErrorText()['refreshCTA'] :
              dataUnavailableReason == DataUnavailableReason.locationPermissionDenied?
              getErrorText()['requestLocationPermissionCTA'] :
              getErrorText()['enableLocationCTA'],
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }

  static Map<String, dynamic> getErrorText() => {
    "noOrSlowInternetConnection": "Showing data from local storage, no stable internet connection available",
    "networkConnectivityError" : "Showing data from local storage, no internet connection available",
    "anErrorOccurred": "An error occurred. Please try again",
    "noLocalData": "Please pull to refresh, Can't fetch data from internet and no local cache available",
    "noLocationPermission": "Please tap \"Request location permission\", Location permission denied",
    "locationNotEnabled": "Please tap \"Enable Location\", Location isn't enabled",
    "enableLocationCTA": "Enable Location",
    "requestLocationPermissionCTA": "Request location permission",
    "refreshCTA": "Refresh"
  };
}
