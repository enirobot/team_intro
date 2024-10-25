import 'package:flutter/material.dart';
import 'package:team_intro/constants.dart';
import 'package:team_intro/models/member_info.dart';
import 'package:team_intro/models/page_info.dart';
import 'package:team_intro/screens/main_menu_page.dart';
import 'package:team_intro/widgets/content_page.dart';
import 'package:team_intro/widgets/introduction_hyunjung.dart';
import 'package:team_intro/widgets/introduction_junny.dart';
import 'package:team_intro/widgets/introduction_junny2.dart';
import 'package:team_intro/widgets/introduction_liyujun.dart';
import 'package:team_intro/widgets/introduction_ksj.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController _pageController;
  late final List<PageInfo> _pages;
  int _activePage = 0; // 현재 활성화된 페이지 인덱스

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pages = [
      PageInfo(
        title: '김승주',
        page: IntroductionKsj(
          memberInfo: const MemberInfo(
            teamName: '구사조',
            imagePath: 'assets/images/seungju_kim.png',
            characterImagePath: 'assets/images/character_seungju_kim.png',
            isLeader: true,
            name: '김승주',
            email: 'pasion2585@naver.com',
            introduction:
                'IT를 좋아하는 일반인입니다.\n앱창업 캠프를 참여하게 되어 매우 기쁩니다.\n좋아하는 음식은 햄버거입니다 🍔',
            mbti: 'ENFP',
            blogUrl:
                'https://pasion2585.notion.site/10b20681ea5f8023a1f4dc5c4242f33c?pvs=4',
          ),
          onBackPressed: () => _navigateToPage(0),
        ),
      ),
      PageInfo(
        title: '이유준',
        page: adde(
          memberInfo: const MemberInfo(
            teamName: '구사조',
            imagePath: 'assets/images/yujun_lee.png',
            characterImagePath: 'assets/images/character_yujun_lee.png',
            isLeader: false,
            name: '이유준',
            email: 'yl1503412@gmail.com',
            introduction: '안녕하세요. \n부트캠프에 참가 하게 되어 \n기쁩니다.',
            mbti: 'ESFJ',
            blogUrl: 'https://yl1503412.tistory.com/',
          ),
          onBackPressed: () => _navigateToPage(0),
        ),
      ),
      PageInfo(
        title: '이승준',
        page: junny2(
          memberInfo: const MemberInfo(
            teamName: '구사조',
            imagePath: 'assets/images/seungjun_lee.png',
            characterImagePath: 'assets/images/character_seungjun_lee.png',
            isLeader: false,
            name: '이승준',
            email: 'junny3344@gmail.com',
            introduction: '좋아하는색 : 주황색\n전공 : 축산과, 양돈, 사무\n관심사 : 인문학',
            mbti: 'ENTP',
            blogUrl: 'https://247wd.tistory.com/',
          ),
          onBackPressed: () => _navigateToPage(0),
        ),
      ),
      PageInfo(
        title: '이현정',
        page: Huynjung(
          memberInfo: const MemberInfo(
            teamName: '구사조',
            imagePath: 'assets/images/hyeonjeong_lee.png',
            characterImagePath: 'assets/images/character_hyeonjeong_lee.png',
            isLeader: false,
            name: '이현정',
            email: 'jl20lemon@gmail.com',
            introduction:
                '안녕하세요, 구사조의 팀원 이현정입니다.\n디자인 경험이 있고, 도장에서 하는\n운동이나 구기운동을 좋아합니다.',
            mbti: 'INFP',
            blogUrl:
                'https://pasion2585.notion.site/10b20681ea5f8023a1f4dc5c4242f33c?pvs=4',
          ),
          onBackPressed: () => _navigateToPage(0),
        ),
      ),
    ];
  }

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: AppConstants.animationDuration,
      curve: AppConstants.animationCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _activePage = page;
                  });
                },
                children: [
                  MainMenuPage(
                    pages: _pages,
                    onPageSelected: _navigateToPage,
                  ),
                  ..._pages.map((pageInfo) => pageInfo.page),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // 중앙에 정렬
            children:
                List.generate(_pages.length, (index) => buildBar(index + 1)),
          ),
        ],
      ),
    );
  }

  Widget buildBar(int index) {
    Color getColor(int pageIndex) {
      switch (pageIndex) {
        case 0:
          return Colors.blue; // Default color for initial state
        case 1:
          return const Color(0xFF00AACC); // Color for page 1
        case 2:
          return const Color(0xFFFFCD29); // Color for page 2
        case 3:
          return const Color(0xFFED8A00); // Color for page 3
        case 4:
          return const Color.fromARGB(255, 205, 215, 80); // Color for page 4
        default:
          return Colors.grey; // Fallback color
      }
    }

    return Expanded(
      child: AnimatedContainer(
        duration:
            const Duration(milliseconds: 180), // Duration of the animation
        height: 8, // Height of the bar
        decoration: BoxDecoration(
          color: _activePage >= index
              ? getColor(_activePage)
              : const Color(0xFFEEEEEE),
        ),
      ),
    );
  }
}
