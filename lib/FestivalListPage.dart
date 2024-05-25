import 'package:flutter/material.dart';
import 'DetailScreen.dart';

class Festival {
  final String title;
  final String ageGroup;
  final String cost;
  final String location;
  final String date;
  final String time;
  final String imagePath;

  Festival({
    required this.title,
    required this.ageGroup,
    required this.cost,
    required this.location,
    required this.date,
    required this.time,
    required this.imagePath,
  });
}

class FestivalListPage extends StatelessWidget {
  final List<Festival> festivals = [
    Festival(
      title: 'Spring Festival',
      ageGroup: 'All Ages',
      cost: 'Free',
      location: 'Central Park',
      date: '2024-06-01',
      time: '10:00 AM - 5:00 PM',
      imagePath: 'assets/대전 0시 축제.jpg',
    ),
    // 추가적인 축제 정보를 여기에 추가하세요.
  ];

  FestivalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Festival List'),
      ),
      body: ListView.builder(
        itemCount: festivals.length,
        itemBuilder: (context, index) {
          final festival = festivals[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                festival.imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(festival.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age Group: ${festival.ageGroup}'),
                  Text('Cost: ${festival.cost}'),
                  Text('Location: ${festival.location}'),
                  Text('Date: ${festival.date}'),
                  Text('Time: ${festival.time}'),
                ],
              ),
              onTap: () {
                // 축제 상세 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}