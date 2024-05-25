import 'package:flutter/material.dart';

import 'FestivalListPage.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedTime = '시간대';
  String _selectedScale = '규모';
  String _selectedAge = '연령';
  String _selectedPrice = '가격';
  String _selectedRegion = '지역';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 검색창과 버튼
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: '검색어를 입력하세요',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // 검색 버튼 클릭 시 FestivalListPage로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FestivalListPage(

                        ),
                      ),
                    );
                  },
                  child: Text('검색'),
                ),
              ],
            ),
            SizedBox(height: 16),
            // 필터들
            Expanded(
              child: ListView(
                children: [
                  _buildDropdown('시간대', ['시간대', '아침', '점심', '저녁', '밤'], (value) {
                    setState(() {
                      _selectedTime = value!;
                    });
                  }),
                  _buildDropdown('규모', ['규모', '소규모', '중규모', '대규모'], (value) {
                    setState(() {
                      _selectedScale = value!;
                    });
                  }),
                  _buildDropdown('연령', ['연령', '어린이', '청소년', '성인', '노인'], (value) {
                    setState(() {
                      _selectedAge = value!;
                    });
                  }),
                  _buildDropdown('가격', ['가격', '무료', '유료'], (value) {
                    setState(() {
                      _selectedPrice = value!;
                    });
                  }),
                  _buildDropdown('지역', ['지역', '☆★☆대전★☆★','서울', '부산', '대구', '인천'], (value) {
                    setState(() {
                      _selectedRegion = value!;
                    });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String title, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: items[0],
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
