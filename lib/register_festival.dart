import 'package:flutter/material.dart';
import 'package:sogra_application/MainPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sogra_application/FestivalListPage.dart';

class InsertScreen extends StatefulWidget {
  InsertScreen({Key? key}) : super(key: key);

  @override
  _InsertScreenState createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  final picker = ImagePicker();
  List<XFile?> multiImage = []; // 갤러리에서 여러 장의 사진을 선택해서 저장할 변수
  List<XFile?> images = []; // 가져온 사진들을 보여주기 위한 변수
  final FestivalListPage festivalListPage = FestivalListPage();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // 추가된 변수들
  String _selectedTimeSlot = '시간대';
  String _selectedScale = '규모';
  String _selectedAgeGroup = '연령';
  String _selectedCost = '가격';
  String _selectedLocation = '지역';

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
                  _selectedTimeSlot = value!;
                });
              }),
              _buildDropdown('규모', ['규모', '소규모', '중규모', '대규모'], (value) {
                setState(() {
                  _selectedScale = value!;
                });
              }),
              _buildDropdown('연령', ['연령', '어린이', '청소년', '성인', '노인'], (value) {
                setState(() {
                  _selectedAgeGroup = value!;
                });
              }),
              _buildDropdown('가격', ['가격', '무료', '유료'], (value) {
                setState(() {
                  _selectedCost = value!;
                });
              }),
              _buildDropdown('지역', ['지역', '☆★☆대전★☆★', '서울', '부산', '대구', '인천'],
                      (value) {
                    setState(() {
                      _selectedLocation = value!;
                    });
                  }),

              const SizedBox(height: 10),

              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 5)
                  ],
                ),
                child: IconButton(
                    onPressed: () async {
                      multiImage = await picker.pickMultiImage();
                      setState(() {
                        //multiImage를 통해 갤러리에서 가지고 온 사진들은 리스트 변수에 저장되므로 addAll()을 사용해서 images와 multiImage 리스트를 합쳐줍니다.
                        images.addAll(multiImage);
                      });
                    },
                    icon: const Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 30,
                      color: Colors.white,
                    )),
              ),

              // 등록 버튼
              ElevatedButton(
                onPressed: () {
                  // 등록 버튼 눌렀을 때 동작
                  _submitData(
                    _titleController.text,
                    _selectedAgeGroup,
                    _selectedCost,
                    _selectedLocation,
                    _selectedTimeSlot,
                    "예시 시간", // time 값을 어떻게 정할지 추가 로직 필요
                    images.isNotEmpty ? images[0]!.path : 'assets/default.jpg', // 첫번째 이미지를 사용하거나 기본 이미지 경로 사용
                  );
                  showToast("축제가 등록되었습니다.");
                },
                child: const Text('등록'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String title, List<String> items, ValueChanged<String?> onChanged) {
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

  void _submitData(String title, String ageGroup, String cost,
      String location, String slot, String time, String imagePath) {
    // 여기에 등록 버튼이 눌렸을 때 데이터를 서버에 전송하고 등록하는 로직을 구현합니다.
    festivalListPage.addFestival(title, ageGroup, cost, location, slot, time, imagePath);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
