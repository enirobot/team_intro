import 'package:flutter/material.dart';
import 'package:team_intro/constants.dart';
import 'package:team_intro/models/member_info.dart';
import 'package:team_intro/models/page_info.dart';
import 'package:team_intro/screens/main_menu_page.dart';
import 'package:team_intro/widgets/content_page.dart';
import 'package:team_intro/widgets/introduction_ksj.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final PageController _pageController;
  late final List<PageInfo> _pages;

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
            introduction: 'IT를 좋아하는 일반인입니다.\n앱창업 캠프를 참여하게 되어 매우 기쁩니다.\n좋아하는 음식은 햄버거입니다 🍔',
            mbti: 'ENFP',
            blogUrl: 'https://pasion2585.notion.site/10b20681ea5f8023a1f4dc5c4242f33c?pvs=4',
          ),
          onBackPressed: () => _navigateToPage(0),
        ),
      ),
      PageInfo(
        title: '이유준',
        page: ContentPage(
          memberInfo: const MemberInfo(
            teamName: '구사조',
            imagePath: 'assets/images/yujun_lee.png',
            characterImagePath: 'assets/images/character_yujun_lee.png',
            isLeader: false,
            name: '이유준',
            email: 'yl1503412@gmail.com',
            introduction: '안녕하세요. \n부트캠프에 참가 하게 되어 \n기뻐요.  평소 노란색을 좋아합니다.',
            mbti: 'ESFJ',
            blogUrl: 'https://pasion2585.notion.site/10b20681ea5f8023a1f4dc5c4242f33c?pvs=4',
          ),
          onBackPressed: () => _navigateToPage(0),
        ),
      ),
      PageInfo(
        title: '이승준',
        page: ContentPage(
          memberInfo: const MemberInfo(
            teamName: '구사조',
            imagePath: 'assets/images/seungjun_lee.png',
            characterImagePath: 'assets/images/character_seungjun_lee.png',
            isLeader: false,
            name: '이승준',
            email: 'junny3344@gmail.com',
            introduction: '좋아하는색 : 주황색\n출신 : 축산과, 양돈, 사무\n관심사 : 인문학',
            mbti: 'ENTP',
            blogUrl: 'https://pasion2585.notion.site/10b20681ea5f8023a1f4dc5c4242f33c?pvs=4',
          ),
          onBackPressed: () => _navigateToPage(0),
        ),
      ),
      PageInfo(
        title: '이현정',
        page: ContentPage(
          memberInfo: const MemberInfo(
            teamName: '구사조',
            imagePath: 'assets/images/hyeonjeong_lee.png',
            characterImagePath: 'assets/images/character_hyeonjeong_lee.png',
            isLeader: false,
            name: '이현정',
            email: 'jl20lemon@gmail.com',
            introduction: '안녕하세요, 구사조의 팀원 이현정입니다.\n디자인 경험이 있고, 도장에서 하는\n운동이나 구기운동을 좋아합니다.',
            mbti: 'INFP',
            blogUrl: 'https://pasion2585.notion.site/10b20681ea5f8023a1f4dc5c4242f33c?pvs=4',
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
      body: PageView(
        controller: _pageController,
        children: [
          MainMenuPage(
            pages: _pages,
            onPageSelected: _navigateToPage,
          ),
          _pages[0].page,  // 팀원 1 페이지
          _pages[1].page,  // 팀원 2 페이지
          _pages[2].page,  // 팀원 3 페이지
          _pages[3].page,  // 팀원 4 페이지
        ],
      ),
    );
  }
}

