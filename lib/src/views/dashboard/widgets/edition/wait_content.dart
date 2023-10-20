import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/src/app/utils/font_app.dart';

class WaitContent extends StatelessWidget {
  const WaitContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children:
                "Welcome\nDon't forget that the first line of your notes will be highlighted as the title.\nEnjoy YNA"
                    .split('\n')
                    .map((line) {
              if (line == "Welcome") {
                return TextSpan(
                  text: "$line\n\n",
                  style: TextStyle(
                    fontFamily: FontApp.mediumStyle,
                    fontSize: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                );
              } else {
                return TextSpan(
                  text: '$line\n',
                  style: TextStyle(
                    fontFamily: FontApp.regularStyle,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
            }).toList(),
          ),
        ),
        const SizedBox(height: 5),
        SvgPicture.asset(
          'assets/icons/winking-icon.svg',
          color: Theme.of(context).primaryColor,
          height: 50,
        ),
      ],
    );
  }
}
