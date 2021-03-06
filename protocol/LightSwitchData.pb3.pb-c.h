/* Generated by the protocol buffer compiler.  DO NOT EDIT! */
/* Generated from: LightSwitchData.pb3 */

#ifndef PROTOBUF_C_LightSwitchData_2epb3__INCLUDED
#define PROTOBUF_C_LightSwitchData_2epb3__INCLUDED

#include <protobuf-c/protobuf-c.h>

PROTOBUF_C__BEGIN_DECLS

#if PROTOBUF_C_VERSION_NUMBER < 1000000
# error This file was generated by a newer version of protoc-c which is incompatible with your libprotobuf-c headers. Please update your headers.
#elif 1003001 < PROTOBUF_C_MIN_COMPILER_VERSION
# error This file was generated by an older version of protoc-c which is incompatible with your libprotobuf-c headers. Please regenerate this file with a newer version of protoc-c.
#endif


typedef struct _Time Time;
typedef struct _LightSwitchState LightSwitchState;
typedef struct _ScheduledAction ScheduledAction;


/* --- enums --- */


/* --- messages --- */

struct  _Time
{
  ProtobufCMessage base;
  /*
   * Represents seconds of UTC time since Unix epoch
   * 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to
   * 9999-12-31T23:59:59Z inclusive.
   */
  protobuf_c_boolean has_seconds;
  int64_t seconds;
};
#define TIME__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&time__descriptor) \
    , 0, 0 }


struct  _LightSwitchState
{
  ProtobufCMessage base;
  protobuf_c_boolean has_lighison;
  protobuf_c_boolean lighison;
  size_t n_scheduledactions;
  ScheduledAction **scheduledactions;
  Time *timestampsent;
};
#define LIGHT_SWITCH_STATE__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&light_switch_state__descriptor) \
    , 0, 0, 0,NULL, NULL }


struct  _ScheduledAction
{
  ProtobufCMessage base;
  protobuf_c_boolean has_turnlighton;
  protobuf_c_boolean turnlighton;
  Time *timetoact;
};
#define SCHEDULED_ACTION__INIT \
 { PROTOBUF_C_MESSAGE_INIT (&scheduled_action__descriptor) \
    , 0, 0, NULL }


/* Time methods */
void   time__init
                     (Time         *message);
size_t time__get_packed_size
                     (const Time   *message);
size_t time__pack
                     (const Time   *message,
                      uint8_t             *out);
size_t time__pack_to_buffer
                     (const Time   *message,
                      ProtobufCBuffer     *buffer);
Time *
       time__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   time__free_unpacked
                     (Time *message,
                      ProtobufCAllocator *allocator);
/* LightSwitchState methods */
void   light_switch_state__init
                     (LightSwitchState         *message);
size_t light_switch_state__get_packed_size
                     (const LightSwitchState   *message);
size_t light_switch_state__pack
                     (const LightSwitchState   *message,
                      uint8_t             *out);
size_t light_switch_state__pack_to_buffer
                     (const LightSwitchState   *message,
                      ProtobufCBuffer     *buffer);
LightSwitchState *
       light_switch_state__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   light_switch_state__free_unpacked
                     (LightSwitchState *message,
                      ProtobufCAllocator *allocator);
/* ScheduledAction methods */
void   scheduled_action__init
                     (ScheduledAction         *message);
size_t scheduled_action__get_packed_size
                     (const ScheduledAction   *message);
size_t scheduled_action__pack
                     (const ScheduledAction   *message,
                      uint8_t             *out);
size_t scheduled_action__pack_to_buffer
                     (const ScheduledAction   *message,
                      ProtobufCBuffer     *buffer);
ScheduledAction *
       scheduled_action__unpack
                     (ProtobufCAllocator  *allocator,
                      size_t               len,
                      const uint8_t       *data);
void   scheduled_action__free_unpacked
                     (ScheduledAction *message,
                      ProtobufCAllocator *allocator);
/* --- per-message closures --- */

typedef void (*Time_Closure)
                 (const Time *message,
                  void *closure_data);
typedef void (*LightSwitchState_Closure)
                 (const LightSwitchState *message,
                  void *closure_data);
typedef void (*ScheduledAction_Closure)
                 (const ScheduledAction *message,
                  void *closure_data);

/* --- services --- */


/* --- descriptors --- */

extern const ProtobufCMessageDescriptor time__descriptor;
extern const ProtobufCMessageDescriptor light_switch_state__descriptor;
extern const ProtobufCMessageDescriptor scheduled_action__descriptor;

PROTOBUF_C__END_DECLS


#endif  /* PROTOBUF_C_LightSwitchData_2epb3__INCLUDED */
