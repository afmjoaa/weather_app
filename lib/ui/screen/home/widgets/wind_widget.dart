import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WindWidget extends StatelessWidget {
  final int visibility;
  final double windDir;

  const WindWidget({Key? key, required this.visibility, required this.windDir}) : super(key: key);

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
                'Wind',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 30, top: 5),
                height: 60,
                width: 60,
                child: SvgPicture.asset(
                  'asset/icons/vento.svg',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Direction: ',
                        style: TextStyle(
                          fontFamily: 'MohrRounded',
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          height: 0.8,
                          color: Color(0xff836eff),
                        ),
                      ),
                      TextSpan(
                        text: ' $windDir°',
                        style: TextStyle(
                          fontFamily: 'MohrRounded',
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          height: 0.8,
                          color: Color(0xff171717),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 35,
                    right: 35,
                  ),
                  height: 25,
                  width: 1,
                  color: Color(0xff836eff),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Visibility: ',
                        style: TextStyle(
                          fontFamily: 'MohrRounded',
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          height: 0.8,
                          color: Color(0xff836eff),
                        ),
                      ),
                      TextSpan(
                        text: ' $visibility m',
                        style: TextStyle(
                          fontFamily: 'MohrRounded',
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          height: 0.8,
                          color: Color(0xff171717),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
