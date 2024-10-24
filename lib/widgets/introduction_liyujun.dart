import 'package:flutter/material.dart';
import 'package:team_intro/models/member_info.dart';
import 'package:url_launcher/url_launcher.dart';

class adde extends StatelessWidget {
  final MemberInfo memberInfo;
  final VoidCallback onBackPressed;

  const adde({
    super.key,
    required this.memberInfo,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end, //축 정렬
      children: [
        const SizedBox(height: 51),
        Container(
            color: const Color.fromARGB(160, 255, 205, 41),
            width: 500,
            height: 400,
            child: Column(
              children: [
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // 글자 색상
                    ),
                    onPressed: onBackPressed,
                    child: Text(
                      memberInfo.teamName,
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Transform.scale(
                      scale: 2.0,
                      child: Image.asset(
                        memberInfo.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(height: 30),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              memberInfo.isLeader ? '팀장 I ' : '팀원 I ',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              memberInfo.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.email, memberInfo.email),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.psychology, 'MBTI: ${memberInfo.mbti}'),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            memberInfo.introduction,
            style: const TextStyle(
              fontSize: 20,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 50),
        InkWell(
          onTap: () => _launchUrl(memberInfo.blogUrl),
          child: _buildInfoRow(Icons.link, '블로그 '),
        ),
        const SizedBox(height: 10),
      ],
    ));
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 26),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
