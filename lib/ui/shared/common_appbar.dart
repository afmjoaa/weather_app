import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String assetLocation;
  final VoidCallback onTapCallback;
  final String title;

  const CommonAppbar({super.key, required this.title, required this.assetLocation, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              onTapCallback.call();
            },
            icon: SvgPicture.asset(
              assetLocation,
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
              height: 20,
              width: 20,
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
