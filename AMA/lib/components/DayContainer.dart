import 'package:ama/constants/Dates.dart';
import 'package:flutter/material.dart';

class DayContainer extends StatefulWidget {
  DayContainer({this.dayNo, this.date});

  final int dayNo;
  final Date date;

  @override
  DayContainerState createState() => DayContainerState();
}

class DayContainerState extends State<DayContainer> {
  int numActivities = 0;
  String activityString = "activities";

  void changeNumActivities(int numActivities) {
    setState(() {
      this.numActivities = numActivities;

      if (this.numActivities == 1)
        this.activityString = "activity";
      else
        this.activityString = "activities";
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          String routeOnTap = "/day" + widget.dayNo.toString() + "Screen";
          Navigator.pushNamed(context, routeOnTap);
        },
        child: Align(
            alignment: Alignment.topCenter,
            child: new SmallCalendarPage(
              date: widget.date,
              dayNo: widget.dayNo,
              activityCount: numActivities,
            )));
  }
}

class SmallCalendarPage extends StatelessWidget {
  const SmallCalendarPage({
    Key key,
    this.date,
    this.dayNo,
    this.activityCount,
  }) : super(key: key);

  final Date date;
  final int dayNo;
  final int activityCount;

  @override
  Widget build(BuildContext context) {
    String activityString;
    (this.activityCount == 1)
        ? (activityString = "activity")
        : (activityString = "activities");

    return Container(
      height: MediaQuery.of(context).size.height * 40 / 100,
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(width: 2),
      ),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(16),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: new Text(date.getWeekDay(), style: TextStyle(fontSize: 30)),
            backgroundColor: Colors.red,
            leading: Padding(
              padding: const EdgeInsets.all(8.5),
              child:
                  Text("#" + dayNo.toString(), style: TextStyle(fontSize: 30)),
            ),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text(
                  date.getDay(),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.black),
                ),
                Text(
                  date.getMonthStr(),
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    activityCount.toString() + " " + activityString,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
