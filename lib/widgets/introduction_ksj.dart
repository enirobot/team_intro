import 'package:flutter/material.dart';
import 'package:team_intro/models/member_info.dart';

class IntroductionKsj extends StatelessWidget {
  final MemberInfo memberInfo;
  final VoidCallback onBackPressed;

  const IntroductionKsj({
    super.key,
    required this.memberInfo,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            color: const Color(0xFF00AACC),
            child: Align(
              alignment:
                  const Alignment(0, -0.3), // x = 0 (가운데), y = -0.3 (상단 30%)
              child: GestureDetector(
                onTap: onBackPressed,
                child: const Text(
                  '구사조',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            // child: Center(
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 20.0), // 하단 패딩 추가
            //     child: GestureDetector(
            //       onTap: onBackPressed,
            //       child: const Text(
            //         '구사조',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 40,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3 - 75,
            left: MediaQuery.of(context).size.width * 0.5 - 75,
            width: 150,
            height: 150,
            child: ClipOval(
              child: Image.asset(
                memberInfo.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
