import 'package:flutter/material.dart';

import 'SearchScreen.dart';
import 'festivalInsert.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈 화면'),
        backgroundColor: Color(0xFFB39DDB), // 연한 보라색
      ),
      body: Stack(
        children: [
          // 상단 이미지
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.3, // 투명도 설정 (0.0 ~ 1.0)
              child: Image.asset(
                'assets/top.jpg', // 이미지 경로
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
          ),
          // 하단 이미지
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.3, // 투명도 설정 (0.0 ~ 1.0)
              child: Image.asset(
                'assets/bot.jpg', // 이미지 경로
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
          ),
          // 나머지 UI
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFB39DDB), // 연한 보라색
                    shadowColor: Colors.purpleAccent, // 그림자 색상
                    elevation: 10, // 그림자 높이
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // 둥근 모서리
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0), // 패딩
                  ),
                  child: const Text(
                    '축제 찾기',
                    style: TextStyle(
                      fontSize: 20.0, // 텍스트 크기
                      fontWeight: FontWeight.bold, // 텍스트 굵기
                    ),
                  ),
                ),
              ),
              SizedBox(height: 200.0), // 버튼 사이에 공간 추가
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InsertScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFB39DDB), // 연한 보라색
                    shadowColor: Colors.purpleAccent, // 그림자 색상
                    elevation: 10, // 그림자 높이
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // 둥근 모서리
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0), // 패딩
                  ),
                  child: const Text(
                    '축제 등록',
                    style: TextStyle(
                      fontSize: 20.0, // 텍스트 크기
                      fontWeight: FontWeight.bold, // 텍스트 굵기
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
