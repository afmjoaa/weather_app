import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class SunriseAndSunsetWidget extends StatelessWidget {
  final String sunRise;
  final String sunSet;

  const SunriseAndSunsetWidget({Key? key, required this.sunRise, required this.sunSet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffF4F4F8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(60),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(60),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              alignment: Alignment.topLeft,
              child: const Text(
                'Sunrise and sunset',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 5,
                  ),
                  child: Text(
                    sunRise,
                    style: const TextStyle(
                      color: Color(0xff171717),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 240,
                  child: Column(
                    children: [
                      Container(
                        height: 105,
                        child: Container(
                          height: 200,
                          width: 180,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 22,
                                child: Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: RDottedLineBorder.all(
                                      color: Color(0xffFCD038),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: -30,
                                child: Container(
                                  height: 35,
                                  width: 200,
                                  child: Image.asset('asset/icons/Sun.png'),
                                ),
                              ),
                              Positioned(
                                top: 50,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  child: SvgPicture.asset(
                                    'asset/icons/sunrise.svg',
                                    color: Color(0xffff7300),
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 78,
                                child: Text(
                                  'sunrise',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffff7300),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 230,
                        color: Color(0xff808080),
                      ),
                      Container(
                        height: 100,
                        child: Container(
                          height: 200,
                          width: 180,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                bottom: 6,
                                child: Container(
                                  height: 180,
                                  width: 178,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE4E4EE),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 50,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  child: SvgPicture.asset(
                                    'asset/icons/sunset.svg',
                                    color: Color(0xffa10000),
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 78,
                                child: Text(
                                  'sunset',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffa10000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5,),
                  child: Text(
                    sunSet,
                    style: const TextStyle(
                      color: Color(0xff171717),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
