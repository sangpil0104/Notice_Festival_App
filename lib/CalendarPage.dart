import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 상단 앱 바 설정
      appBar: AppBar(
        title: Text('축제 일정 확인'), // 앱 바의 타이틀 설정
        backgroundColor: Color(0xFFB39DDB),
      ),
      // 달력을 표시하는 TableCalendar 위젯을 body에 추가
      body: TableCalendar(
        onDaySelected: onDaySelected,
        selectedDayPredicate: (date) {
          return isSameDay(selectedDate, date);
        },
        focusedDay: DateTime.now(),  // 현재 날짜를 기준으로 달력을 표시
        firstDay: DateTime(2020),    // 달력의 시작 날짜 설정
        lastDay: DateTime(2030),     // 달력의 마지막 날짜 설정
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
