///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

class Time extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Time')
    ..aInt64(1, 'seconds')
    ..hasRequiredFields = false
  ;

  Time() : super();
  Time.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Time.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Time clone() => new Time()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Time create() => new Time();
  static PbList<Time> createRepeated() => new PbList<Time>();
  static Time getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyTime();
    return _defaultInstance;
  }
  static Time _defaultInstance;
  static void $checkItem(Time v) {
    if (v is! Time) checkItemFailed(v, 'Time');
  }

  Int64 get seconds => $_getI64(0);
  set seconds(Int64 v) { $_setInt64(0, v); }
  bool hasSeconds() => $_has(0);
  void clearSeconds() => clearField(1);
}

class _ReadonlyTime extends Time with ReadonlyMessageMixin {}

class LightSwitchState extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('LightSwitchState')
    ..aOB(1, 'lighIsOn')
    ..pp<ScheduledAction>(2, 'scheduledActions', PbFieldType.PM, ScheduledAction.$checkItem, ScheduledAction.create)
    ..a<Time>(3, 'timeStampSent', PbFieldType.OM, Time.getDefault, Time.create)
    ..hasRequiredFields = false
  ;

  LightSwitchState() : super();
  LightSwitchState.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  LightSwitchState.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  LightSwitchState clone() => new LightSwitchState()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static LightSwitchState create() => new LightSwitchState();
  static PbList<LightSwitchState> createRepeated() => new PbList<LightSwitchState>();
  static LightSwitchState getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyLightSwitchState();
    return _defaultInstance;
  }
  static LightSwitchState _defaultInstance;
  static void $checkItem(LightSwitchState v) {
    if (v is! LightSwitchState) checkItemFailed(v, 'LightSwitchState');
  }

  bool get lighIsOn => $_get(0, false);
  set lighIsOn(bool v) { $_setBool(0, v); }
  bool hasLighIsOn() => $_has(0);
  void clearLighIsOn() => clearField(1);

  List<ScheduledAction> get scheduledActions => $_getList(1);

  Time get timeStampSent => $_getN(2);
  set timeStampSent(Time v) { setField(3, v); }
  bool hasTimeStampSent() => $_has(2);
  void clearTimeStampSent() => clearField(3);
}

class _ReadonlyLightSwitchState extends LightSwitchState with ReadonlyMessageMixin {}

class ScheduledAction extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ScheduledAction')
    ..aOB(1, 'turnLightOn')
    ..a<Time>(2, 'timeToAct', PbFieldType.OM, Time.getDefault, Time.create)
    ..hasRequiredFields = false
  ;

  ScheduledAction() : super();
  ScheduledAction.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ScheduledAction.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ScheduledAction clone() => new ScheduledAction()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ScheduledAction create() => new ScheduledAction();
  static PbList<ScheduledAction> createRepeated() => new PbList<ScheduledAction>();
  static ScheduledAction getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyScheduledAction();
    return _defaultInstance;
  }
  static ScheduledAction _defaultInstance;
  static void $checkItem(ScheduledAction v) {
    if (v is! ScheduledAction) checkItemFailed(v, 'ScheduledAction');
  }

  bool get turnLightOn => $_get(0, false);
  set turnLightOn(bool v) { $_setBool(0, v); }
  bool hasTurnLightOn() => $_has(0);
  void clearTurnLightOn() => clearField(1);

  Time get timeToAct => $_getN(1);
  set timeToAct(Time v) { setField(2, v); }
  bool hasTimeToAct() => $_has(1);
  void clearTimeToAct() => clearField(2);
}

class _ReadonlyScheduledAction extends ScheduledAction with ReadonlyMessageMixin {}

