import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('축제 상세 보기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '2023 대전 0시 축제',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/대전 0시 축제.jpg', // 이미지를 불러올 URL로 교체하세요.
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              '1960년~2040년까지 세계 최고의 과학기술로 만나는 시간여행축제',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              '대전 윈드 오케스트라 70인조 공연\n'
                  '일시 : 2023. 08. 14(월)\n'
                  '시간 : 20:00 ~ 21:00\n'
                  '\n'
                  '2023. 08. 11(금) - 17(목) 매일 14:00 ~ 00:00\n'
                  '중앙로(대전역~옛 충남도청)등 원도심 일원\n'
                  '\n'
                  '과거 - 낭만 대전 뉴트로 대전부르스 : 60년대 추억의 대전 체험관, 라디오드라마 별이 빛나는 밤, 대전부르스 창작가요제\n'
                  '현재 - 꿀잼 대전 대한민국 K-컬처 : K-POP 콘서트, HOT 퍼레이드, 길거리 문화예술공연\n'
                  '미래 - 빅잼 대전 미래 도시 대전 : 3D 홀로그램 빛의 거리, 첨단 미디어 아트쇼, 올나잇 제로파티\n',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}