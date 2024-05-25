import 'package:flutter/material.dart';

class InsertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryPage(),
    );
  }
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController _titleController = TextEditingController(); // 제목 텍스트 필드 컨트롤러
  TextEditingController _contentController = TextEditingController(); // 내용 텍스트 필드 컨트롤러

  String _selectedTime = '시간대';
  String _selectedScale = '규모';
  String _selectedAge = '연령';
  String _selectedPrice = '가격';
  String _selectedRegion = '지역';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 제목 입력 텍스트 필드
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter title...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // 내용 입력 텍스트 필드
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter content...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // 드롭다운 메뉴들
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
            _buildDropdown('지역', ['지역', '서울', '부산', '대구', '인천'], (value) {
              setState(() {
                _selectedRegion = value!;
              });
            }),
            SizedBox(height: 10),
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

  @override
  void dispose() {
    // 페이지가 dispose 될 때 컨트롤러도 함께 dispose 되도록 함
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
