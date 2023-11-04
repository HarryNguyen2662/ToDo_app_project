import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Good Morning, Nhật lồn')),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(children: [
              CalendarTimeline(
                initialDate: DateTime(2020, 4, 20),
                firstDate: DateTime(2019, 1, 15),
                lastDate: DateTime(2020, 11, 20),
                onDateSelected: (date) => print(date),
                leftMargin: 20,
                monthColor: Colors.blueGrey,
                dayColor: Colors.teal[200],
                activeDayColor: Colors.white,
                activeBackgroundDayColor: Colors.redAccent[100],
                dotsColor: Color(0xFF333A47),
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
              ),
              buildScheduleList(),
            ]),
          ),
          buildAddButton(),
        ],
      ),
    );
  }

  Widget buildScheduleList() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Schedule Today',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ScheduleCard(time: '08:00', title: 'Do something useful'),
              ScheduleCard(time: '10:00', title: 'Be useless again'),
              ScheduleCard(time: '10:00', title: 'Chịch chịch chịch'),
              ScheduleCard(time: '17:00', title: 'AAAAAA chụp thuốc mê'),
              ScheduleCard(time: '21:00', title: 'Be useless again'),
              //...
            ],
          ),
        ]));
  }

  Widget buildAddButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Đặt màu nền cho Container thành màu đen
          borderRadius: BorderRadius.circular(
              20.0), // Đặt bo góc với bán kính 10.0 (hoặc bất kỳ giá trị nào bạn muốn)
        ),
        height: 50,
        width: 300,
        margin: EdgeInsets.only(
            bottom:
                16), // Đặt khoảng cách bottom là 16 (hoặc bất kỳ giá trị nào bạn muốn)
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.transparent), // Đặt màu nền của nút thành trong suốt
            overlayColor: MaterialStateProperty.all(
                Colors.black), // Đặt màu khi nút được nhấn thành màu đen
            foregroundColor: MaterialStateProperty.all(
                Colors.white), // Đặt màu chữ thành màu trắng
          ),
          child: Text('Add Schedule'),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String time;
  final String title;

  ScheduleCard({required this.time, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 248, 248, 248),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 0.0)
              ..rotateZ(0.78),
            child: Container(
              width: 45,
              height: 45,
              decoration: ShapeDecoration(
                color: Color(0xFFABA1E9),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(-2.5, 12.0)
                    ..rotateZ(-0.78),
                  child: Text(
                    this.time,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: 260,
            height: 64,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: Color(0xFFABA1E9),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              this.title,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
