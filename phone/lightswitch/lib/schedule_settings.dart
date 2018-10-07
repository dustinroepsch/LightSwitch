import 'package:flutter/widgets.dart';
import 'LightSwitchData.pb.dart';
import 'package:flutter/material.dart';

class ScheduledActionView extends StatelessWidget {

  final ScheduledAction scheduledAction;
  
  ScheduledActionView({Key key, @required this.scheduledAction }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text("${DateTime.fromMillisecondsSinceEpoch(scheduledAction.timeToAct.seconds.toInt() * 1000).toIso8601String()}"));
  }

}

class ScheduleSettings extends StatelessWidget {
  final ValueChanged<List<ScheduledAction>> onScheduledActionChanged;
  final List<ScheduledAction> actions;
  ScheduleSettings({Key key, @required this.onScheduledActionChanged, @required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Schedule"),),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ScheduledActionView(scheduledAction: actions[index],);
        },
        itemCount: actions.length,
      ),
      );

  }
}
