import 'package:flutter/material.dart';
import 'package:team_intro/models/page_info.dart';

class MainMenuPage extends StatelessWidget {
  final List<PageInfo> pages;
  final Function(int) onPageSelected;

  const MainMenuPage({
    super.key,
    required this.pages,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // 좌우 패딩 설정
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => onPageSelected(1),
                    child: Column(
                      children: [
                        Text(
                          pages[0].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, // 볼드체
                            fontSize: 30.0, // 글자 크기
                          ),
                        ),
                        const SizedBox(height: 10),
                        Image.asset(
                          'assets/images/character_seungju_kim.png',
                          width: MediaQuery.of(context).size.width * 0.45,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  const Flexible(
                    // Add Flexible here
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 12.0), // Flexible 부분에 왼쪽 패딩 추가
                          child: Text(
                            '구사조',
                            softWrap: true,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // 볼드체
                              fontSize: 50.0, // 글자 크기
                            ),
                          ),
                        ),
                        SizedBox(height: 13),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 13.0), // Flexible 부분에 왼쪽 패딩 추가
                          child: Text(
                            '안녕하세요!\n구사조입니다.',
                            softWrap: true,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // 볼드체
                              fontSize: 18.0, // 글자 크기
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 14.0), // Flexible 부분에 왼쪽 패딩 추가
                          child: Text(
                            '94조 기업가치를 꿈꾸는\n예비 창업가들의 팀입니다.',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 15.0, // 글자 크기
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => onPageSelected(2),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/character_yujun_lee.png',
                          width: MediaQuery.of(context).size.width * 0.3 - 2,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          pages[1].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, // 볼드체
                            fontSize: 30.0, // 글자 크기
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 3),
                  GestureDetector(
                    onTap: () => onPageSelected(3),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/character_seungjun_lee.png',
                          width: MediaQuery.of(context).size.width * 0.3 - 2,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          pages[2].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, // 볼드체
                            fontSize: 30.0, // 글자 크기
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 3),
                  GestureDetector(
                    onTap: () => onPageSelected(4),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/character_hyeonjeong_lee.png',
                          width: MediaQuery.of(context).size.width * 0.3 - 2,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          pages[3].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, // 볼드체
                            fontSize: 30.0, // 글자 크기
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () => onPageSelected(1),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // 모서리 곡선 정도
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '팀원보기',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
