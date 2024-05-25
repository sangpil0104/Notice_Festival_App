import 'package:flutter/material.dart';
import 'package:sogra_application/home_screen.dart';
import 'FestivalListPage.dart';

class InsertScreen extends StatefulWidget {
  @override
  _InsertScreenState createState() => _InsertScreenState()
}

class _InsertScreenState extends State<InsertScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  String _selectedTime = '시간대';
  String _selectedScale = '규모';
  String _selectedAge = '연령';
  String _selectedPrice = '가격';
  String _selectedRegion = '지역';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('축제 등록'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: '제목을 입력하시오.',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: '내용을 입력하시오.',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
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
            _buildDropdown('지역', ['지역', '☆★☆대전★☆★', '서울', '부산', '대구', '인천'], (value) {
              setState(() {
                _selectedRegion = value!;
              });
            }),

            SizedBox(height: 10),

            // 점선 직사각형 (이미지 업로드 틀)
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(4),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Drop your image here'),
                    Icon(Icons.cloud_upload, size: 50),
                  ],
                ),
              ),
            ),

            // 등록 버튼
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    // 등록 버튼 눌렀을 때 동작
                    _submitData();
                  },
                  child: Text('등록'),
                ),
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

  void _submitData() {
    // 여기에 등록 버튼이 눌렸을 때 데이터를 서버에 전송하고 등록하는 로직을 구현합니다.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FestivalListPage()),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
