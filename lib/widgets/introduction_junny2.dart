import 'package:flutter/material.dart';
import 'package:team_intro/models/member_info.dart';
import 'package:team_intro/widgets/webview_page%20.dart';

class junny2 extends StatelessWidget {
  final MemberInfo memberInfo;
  final VoidCallback onBackPressed;

  const junny2({
    super.key,
    required this.memberInfo,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    String isLeader = memberInfo.isLeader ? '팀장' : '팀원';
    String name = memberInfo.name;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3 + 75 + 20),
                Text(
                  '$isLeader | $name',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.email, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      memberInfo.email,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  memberInfo.introduction,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center, // 텍스트 가운데 정렬
                ),
                const SizedBox(height: 20),
                Text(
                  memberInfo.mbti,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8, // 가로 길이
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFED8A00),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // 모서리 곡선 정도
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WebViewPage(url: memberInfo.blogUrl),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '블로그',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            color: const Color(0xFFED8A00),
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
                    fontSize: 50,
                  ),
                ),
              ),
            ),
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
