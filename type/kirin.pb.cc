// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: kirin.proto

#define INTERNAL_SUPPRESS_PROTOBUF_FIELD_DEPRECATION
#include "kirin.pb.h"

#include <algorithm>

#include <google/protobuf/stubs/common.h>
#include <google/protobuf/stubs/port.h>
#include <google/protobuf/stubs/once.h>
#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/wire_format_lite_inl.h>
#include <google/protobuf/descriptor.h>
#include <google/protobuf/generated_message_reflection.h>
#include <google/protobuf/reflection_ops.h>
#include <google/protobuf/wire_format.h>
// @@protoc_insertion_point(includes)

namespace kirin {

namespace {

const ::google::protobuf::EnumDescriptor* StopTimeEventStatus_descriptor_ = NULL;

}  // namespace


void protobuf_AssignDesc_kirin_2eproto() GOOGLE_ATTRIBUTE_COLD;
void protobuf_AssignDesc_kirin_2eproto() {
  protobuf_AddDesc_kirin_2eproto();
  const ::google::protobuf::FileDescriptor* file =
    ::google::protobuf::DescriptorPool::generated_pool()->FindFileByName(
      "kirin.proto");
  GOOGLE_CHECK(file != NULL);
  StopTimeEventStatus_descriptor_ = file->enum_type(0);
}

namespace {

GOOGLE_PROTOBUF_DECLARE_ONCE(protobuf_AssignDescriptors_once_);
inline void protobuf_AssignDescriptorsOnce() {
  ::google::protobuf::GoogleOnceInit(&protobuf_AssignDescriptors_once_,
                 &protobuf_AssignDesc_kirin_2eproto);
}

void protobuf_RegisterTypes(const ::std::string&) GOOGLE_ATTRIBUTE_COLD;
void protobuf_RegisterTypes(const ::std::string&) {
  protobuf_AssignDescriptorsOnce();
}

}  // namespace

void protobuf_ShutdownFile_kirin_2eproto() {
}

void protobuf_AddDesc_kirin_2eproto() GOOGLE_ATTRIBUTE_COLD;
void protobuf_AddDesc_kirin_2eproto() {
  static bool already_here = false;
  if (already_here) return;
  already_here = true;
  GOOGLE_PROTOBUF_VERIFY_VERSION;

  ::transit_realtime::protobuf_AddDesc_gtfs_2drealtime_2eproto();
  ::google::protobuf::DescriptorPool::InternalAddGeneratedFile(
    "\n\013kirin.proto\022\005kirin\032\023gtfs-realtime.prot"
    "o*w\n\023StopTimeEventStatus\022\r\n\tSCHEDULED\020\000\022"
    "\013\n\007DELETED\020\001\022\013\n\007NO_DATA\020\002\022\t\n\005ADDED\020\003\022\026\n\022"
    "DELETED_FOR_DETOUR\020\004\022\024\n\020ADDED_FOR_DETOUR"
    "\020\005:3\n\014trip_message\022\034.transit_realtime.Tr"
    "ipUpdate\030\350\007 \001(\t:M\n\006effect\022\034.transit_real"
    "time.TripUpdate\030\351\007 \001(\0162\036.transit_realtim"
    "e.Alert.Effect:/\n\010headsign\022\034.transit_rea"
    "ltime.TripUpdate\030\352\007 \001(\t:6\n\013contributor\022 "
    ".transit_realtime.TripDescriptor\030\350\007 \001(\t:"
    "5\n\ncompany_id\022 .transit_realtime.TripDes"
    "criptor\030\351\007 \001(\t:F\n\020stoptime_message\022+.tra"
    "nsit_realtime.TripUpdate.StopTimeUpdate\030"
    "\350\007 \001(\t:\223\001\n\034stop_time_event_relationship\022"
    "*.transit_realtime.TripUpdate.StopTimeEv"
    "ent\030\350\007 \001(\0162@.transit_realtime.TripUpdate"
    ".StopTimeUpdate.ScheduleRelationship:g\n\026"
    "stop_time_event_status\022*.transit_realtim"
    "e.TripUpdate.StopTimeEvent\030\351\007 \001(\0162\032.kiri"
    "n.StopTimeEventStatus:>\n\020physical_mode_i"
    "d\022#.transit_realtime.VehicleDescriptor\030\350"
    "\007 \001(\t", 845);
  ::google::protobuf::MessageFactory::InternalRegisterGeneratedFile(
    "kirin.proto", &protobuf_RegisterTypes);
  ::google::protobuf::internal::ExtensionSet::RegisterExtension(
    &::transit_realtime::TripUpdate::default_instance(),
    1000, 9, false, false);
  ::google::protobuf::internal::ExtensionSet::RegisterEnumExtension(
    &::transit_realtime::TripUpdate::default_instance(),
    1001, 14, false, false,
    &::transit_realtime::Alert_Effect_IsValid);
  ::google::protobuf::internal::ExtensionSet::RegisterExtension(
    &::transit_realtime::TripUpdate::default_instance(),
    1002, 9, false, false);
  ::google::protobuf::internal::ExtensionSet::RegisterExtension(
    &::transit_realtime::TripDescriptor::default_instance(),
    1000, 9, false, false);
  ::google::protobuf::internal::ExtensionSet::RegisterExtension(
    &::transit_realtime::TripDescriptor::default_instance(),
    1001, 9, false, false);
  ::google::protobuf::internal::ExtensionSet::RegisterExtension(
    &::transit_realtime::TripUpdate_StopTimeUpdate::default_instance(),
    1000, 9, false, false);
  ::google::protobuf::internal::ExtensionSet::RegisterEnumExtension(
    &::transit_realtime::TripUpdate_StopTimeEvent::default_instance(),
    1000, 14, false, false,
    &::transit_realtime::TripUpdate_StopTimeUpdate_ScheduleRelationship_IsValid);
  ::google::protobuf::internal::ExtensionSet::RegisterEnumExtension(
    &::transit_realtime::TripUpdate_StopTimeEvent::default_instance(),
    1001, 14, false, false,
    &::kirin::StopTimeEventStatus_IsValid);
  ::google::protobuf::internal::ExtensionSet::RegisterExtension(
    &::transit_realtime::VehicleDescriptor::default_instance(),
    1000, 9, false, false);
  ::google::protobuf::internal::OnShutdown(&protobuf_ShutdownFile_kirin_2eproto);
}

// Force AddDescriptors() to be called at static initialization time.
struct StaticDescriptorInitializer_kirin_2eproto {
  StaticDescriptorInitializer_kirin_2eproto() {
    protobuf_AddDesc_kirin_2eproto();
  }
} static_descriptor_initializer_kirin_2eproto_;
const ::google::protobuf::EnumDescriptor* StopTimeEventStatus_descriptor() {
  protobuf_AssignDescriptorsOnce();
  return StopTimeEventStatus_descriptor_;
}
bool StopTimeEventStatus_IsValid(int value) {
  switch(value) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      return true;
    default:
      return false;
  }
}

const ::std::string trip_message_default("");
::google::protobuf::internal::ExtensionIdentifier< ::transit_realtime::TripUpdate,
    ::google::protobuf::internal::StringTypeTraits, 9, false >
  trip_message(kTripMessageFieldNumber, trip_message_default);
::google::protobuf::internal::ExtensionIdentifier< ::transit_realtime::TripUpdate,
    ::google::protobuf::internal::EnumTypeTraits< ::transit_realtime::Alert_Effect, ::transit_realtime::Alert_Effect_IsValid>, 14, false >
  effect(kEffectFieldNumber, static_cast< ::transit_realtime::Alert_Effect >(1));
const ::std::string headsign_default("");
::google::protobuf::internal::ExtensionIdentifier< ::transit_realtime::TripUpdate,
    ::google::protobuf::internal::StringTypeTraits, 9, false >
  headsign(kHeadsignFieldNumber, headsign_default);
const ::std::string contributor_default("");
::google::protobuf::internal::ExtensionIdentifier< ::transit_realtime::TripDescriptor,
    ::google::protobuf::internal::StringTypeTraits, 9, false >
  contributor(kContributorFieldNumber, contributor_default);
const ::std::string company_id_default("");
::google::protobuf::internal::ExtensionIdentifier< ::transit_realtime::TripDescriptor,
    ::google::protobuf::internal::StringTypeTraits, 9, false >
  company_id(kCompanyIdFieldNumber, company_id_default);
const ::std::string stoptime_message_default("");
::google::protobuf::internal::ExtensionIdentifier< ::transit_realtime::TripUpdate_StopTimeUpdate,
    ::google::protobuf::internal::StringTypeTraits, 9, false >
  stoptime_message(kStoptimeMessageFieldNumber, stoptime_message_default);
::google::protobuf::internal::ExtensionIdentifier< ::transit_realtime::TripUpdate_StopTimeEvent,
    ::google::protobuf::internal::EnumTypeTraits< ::transit_realtime::TripUpdate_StopTimeUpdate_ScheduleRelationship, ::transit_realtime::TripUpdate_StopTimeUpdate_ScheduleRelationship_IsValid>, 14, false >
  stop_time_event_relationship(kStopTimeEventRelationshipFieldNumber, static_cast< ::transit_realtime::TripUpdate_StopTimeUpdate_ScheduleRelationship >(0));
::google::protobuf::internal::ExtensionIdentifier< ::transit_realtime::TripUpdate_StopTimeEvent,
    ::google::protobuf::internal::EnumTypeTraits< ::kirin::StopTimeEventStatus, ::kirin::StopTimeEventStatus_IsValid>, 14, false >
  stop_time_event_status(kStopTimeEventStatusFieldNumber, static_cast< ::kirin::StopTimeEventStatus >(0));
const ::std::string physical_mode_id_default("");
::google::protobuf::internal::ExtensionIdentifier< ::transit_realtime::VehicleDescriptor,
    ::google::protobuf::internal::StringTypeTraits, 9, false >
  physical_mode_id(kPhysicalModeIdFieldNumber, physical_mode_id_default);

// @@protoc_insertion_point(namespace_scope)

}  // namespace kirin

// @@protoc_insertion_point(global_scope)
