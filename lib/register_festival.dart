import 'package:flutter/material.dart';
import 'FestivalListPage.dart';


class InsertScreen extends StatefulWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  _InsertScreenState createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('축제 등록'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: '제목을 입력하시오.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _contentController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: '내용을 입력하시오.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              _buildDropdown('시간대', ['시간대', '아침', '점심', '저녁', '밤'], (value) {
                setState(() {
                });
              }),
              _buildDropdown('규모', ['규모', '소규모', '중규모', '대규모'], (value) {
                setState(() {
                });
              }),
              _buildDropdown('연령', ['연령', '어린이', '청소년', '성인', '노인'], (value) {
                setState(() {
                });
              }),
              _buildDropdown('가격', ['가격', '무료', '유료'], (value) {
                setState(() {
                });
              }),
              _buildDropdown('지역', ['지역', '☆★☆대전★☆★', '서울', '부산', '대구', '인천'], (value) {
                setState(() {
                });
              }),

              const SizedBox(height: 10),

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
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Drop your image here'),
                      Icon(Icons.cloud_upload, size: 50),
                    ],
                  ),
                ),
              ),

              // 등록 버튼
              ElevatedButton(
                onPressed: () {
                  // 등록 버튼 눌렀을 때 동작
                  _submitData();
                },
                child: const Text('등록'),
              ),
            ],
          ),
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
          border: const OutlineInputBorder(),
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
