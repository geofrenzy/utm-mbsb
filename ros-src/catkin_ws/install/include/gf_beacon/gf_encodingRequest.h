// Generated by gencpp from file gf_beacon/gf_encodingRequest.msg
// DO NOT EDIT!


#ifndef GF_BEACON_MESSAGE_GF_ENCODINGREQUEST_H
#define GF_BEACON_MESSAGE_GF_ENCODINGREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace gf_beacon
{
template <class ContainerAllocator>
struct gf_encodingRequest_
{
  typedef gf_encodingRequest_<ContainerAllocator> Type;

  gf_encodingRequest_()
    : lng_deg(0.0)
    , lat_deg(0.0)
    , alt_agl_m(0.0)
    , speed_mph(0.0)
    , heading_deg(0.0)
    , battery_level(0.0)
    , flying_state_on(0)
    , return_to_home_state_on(0)
    , forced_landing_state_on(0)  {
    }
  gf_encodingRequest_(const ContainerAllocator& _alloc)
    : lng_deg(0.0)
    , lat_deg(0.0)
    , alt_agl_m(0.0)
    , speed_mph(0.0)
    , heading_deg(0.0)
    , battery_level(0.0)
    , flying_state_on(0)
    , return_to_home_state_on(0)
    , forced_landing_state_on(0)  {
  (void)_alloc;
    }



   typedef double _lng_deg_type;
  _lng_deg_type lng_deg;

   typedef double _lat_deg_type;
  _lat_deg_type lat_deg;

   typedef double _alt_agl_m_type;
  _alt_agl_m_type alt_agl_m;

   typedef double _speed_mph_type;
  _speed_mph_type speed_mph;

   typedef double _heading_deg_type;
  _heading_deg_type heading_deg;

   typedef double _battery_level_type;
  _battery_level_type battery_level;

   typedef uint16_t _flying_state_on_type;
  _flying_state_on_type flying_state_on;

   typedef uint16_t _return_to_home_state_on_type;
  _return_to_home_state_on_type return_to_home_state_on;

   typedef uint16_t _forced_landing_state_on_type;
  _forced_landing_state_on_type forced_landing_state_on;




  typedef boost::shared_ptr< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> const> ConstPtr;

}; // struct gf_encodingRequest_

typedef ::gf_beacon::gf_encodingRequest_<std::allocator<void> > gf_encodingRequest;

typedef boost::shared_ptr< ::gf_beacon::gf_encodingRequest > gf_encodingRequestPtr;
typedef boost::shared_ptr< ::gf_beacon::gf_encodingRequest const> gf_encodingRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::gf_beacon::gf_encodingRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace gf_beacon

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b4f5ff271c45bb829d5e504e08e16e34";
  }

  static const char* value(const ::gf_beacon::gf_encodingRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb4f5ff271c45bb82ULL;
  static const uint64_t static_value2 = 0x9d5e504e08e16e34ULL;
};

template<class ContainerAllocator>
struct DataType< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "gf_beacon/gf_encodingRequest";
  }

  static const char* value(const ::gf_beacon::gf_encodingRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 lng_deg\n\
float64 lat_deg\n\
float64 alt_agl_m\n\
float64 speed_mph\n\
float64 heading_deg\n\
float64 battery_level\n\
uint16 flying_state_on\n\
uint16 return_to_home_state_on\n\
uint16 forced_landing_state_on\n\
";
  }

  static const char* value(const ::gf_beacon::gf_encodingRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.lng_deg);
      stream.next(m.lat_deg);
      stream.next(m.alt_agl_m);
      stream.next(m.speed_mph);
      stream.next(m.heading_deg);
      stream.next(m.battery_level);
      stream.next(m.flying_state_on);
      stream.next(m.return_to_home_state_on);
      stream.next(m.forced_landing_state_on);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct gf_encodingRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gf_beacon::gf_encodingRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::gf_beacon::gf_encodingRequest_<ContainerAllocator>& v)
  {
    s << indent << "lng_deg: ";
    Printer<double>::stream(s, indent + "  ", v.lng_deg);
    s << indent << "lat_deg: ";
    Printer<double>::stream(s, indent + "  ", v.lat_deg);
    s << indent << "alt_agl_m: ";
    Printer<double>::stream(s, indent + "  ", v.alt_agl_m);
    s << indent << "speed_mph: ";
    Printer<double>::stream(s, indent + "  ", v.speed_mph);
    s << indent << "heading_deg: ";
    Printer<double>::stream(s, indent + "  ", v.heading_deg);
    s << indent << "battery_level: ";
    Printer<double>::stream(s, indent + "  ", v.battery_level);
    s << indent << "flying_state_on: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.flying_state_on);
    s << indent << "return_to_home_state_on: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.return_to_home_state_on);
    s << indent << "forced_landing_state_on: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.forced_landing_state_on);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GF_BEACON_MESSAGE_GF_ENCODINGREQUEST_H