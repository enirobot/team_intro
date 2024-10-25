import 'package:flutter/material.dart';
import 'package:team_intro/models/member_info.dart';
import 'package:url_launcher/url_launcher.dart';

class Huynjung extends StatelessWidget {
  final MemberInfo memberInfo;
  final VoidCallback onBackPressed;

  const Huynjung({
    super.key,
    required this.memberInfo,
    required this.onBackPressed,
  });
  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: [
          Container(
              child: Column(children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 1,
                color: Color.fromARGB(255, 205, 215, 80)),
            Container(
                height: MediaQuery.of(context).size.height * 0.64,
                width: MediaQuery.of(context).size.width * 1,
                color: Color.fromARGB(230, 230, 230, 230))
          ])),
          Positioned(
              top: 65,
              right: MediaQuery.of(context).size.width * 0.5 - 100,
              child: Stack(children: [
                Container(
                    width: 200,
                    child: Column(children: [
                      const Text('구사조',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w900,
                          )),
                    ])),
              ])),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.35 - 70,
              right: MediaQuery.of(context).size.width * 0.5 - 70,
              child: Stack(children: [
                Container(
                  child: Image.asset('assets/images/hyunjung_lee.png'),
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(230, 230, 230, 230),
                  ),
                ),
              ])),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.47,
              right: MediaQuery.of(context).size.width * 0.5 - 190,
              child: Stack(children: [
                Container(
                    width: 380,
                    child: Column(children: [
                      const Text('팀원 | 이현정',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          )),
                      const SizedBox(height: 8),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                size: 20.0,
                              ),
                              const SizedBox(width: 5),
                              const Text('jl20lemon@gmail.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ]),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          '안녕하세요, 구사조의 팀원 이현정입니다. \n디자인 경험이 있고, 도장에서 하는 \n운동과 구기운동을 좋아합니다.',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                      const SizedBox(height: 15),
                      const Text('INFP',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          )),
                    ])),
              ])),
          Positioned(
              bottom: 60,
              right: MediaQuery.of(context).size.width * 0.5 - 160,
              child: Stack(children: [
                ElevatedButton(
                  onPressed: _launchURL,
                  child: Text('블로그 바로가기'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(85, 25, 85, 25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0,
                    ),
                  ),
                )
              ])),
        ])),
      );
    }
  // URL을 여는 함수
  void _launchURL() async {
    const url = 'https://jl20lemon.tistory.com/';  // 외부 링크
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
  }