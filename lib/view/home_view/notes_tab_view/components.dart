import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/theme/colors.dart';
import '../../app_components.dart';

class BuildNoteWidget extends StatelessWidget {
  const BuildNoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      constraints: BoxConstraints(maxWidth: infinityWidth, minHeight: 80.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        color: pinkClr,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: TextUtil(
              text: 'Todo',
              fontSize: 16.sp,
              color: whiteClr,
              fontWeight: FontWeight.w600,
            ),
          ),
          horizontalSpace2(),
          Container(
            height: 70.0,
            width: 1.0,
            color: whiteClr,
          ),
          horizontalSpace2(),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtil(
                    text:
                    'MediaQuery. I am a noob, so would really like to understand. Otherwise,',
                    fontSize: 16.sp,
                    color: whiteClr,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.justify,
                  ),
                  verticalSpace1(),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 22.sp,
                        color: whiteClr,
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextUtil(
                          text: DateTime.now().toString(),
                          fontSize: 14.sp,
                          color: whiteClr,
                          fontWeight: FontWeight.w600,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          horizontalSpace2(),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Image.network(
                'https://images.ctfassets.net/hrltx12pl8hq/2TRIFRwcjrTuNprkTQHVxs/088159eb8e811aaac789c24701d7fdb1/LP_image.jpg?fit=fill&w=480&h=268',
                height: 80,
                width: 80,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
