import 'package:flutter/material.dart';
import 'festivalInsert.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              // 버튼을 눌렀을 때 실행할 코드
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.purple, // 텍스트 색상
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
        Center(
          child: ElevatedButton(
            onPressed: () {
              // 버튼을 눌렀을 때 실행할 코드
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InsertScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.purple, // 텍스트 색상
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
    );
  }
}
