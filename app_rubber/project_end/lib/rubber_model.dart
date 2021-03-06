import 'package:google_maps_flutter/google_maps_flutter.dart';

class Rubber {
  String name;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Rubber({
    this.name,
    this.address,
    this.description,
    this.thumbNail,
    this.locationCoords,
  });
}

final List<Rubber> rubbersCoords = [
  Rubber(
      name: 'นาย a',
      address: '18 W 29th St',
      description:
          'ขายน้ำยาง',
      locationCoords: LatLng(14.819019, 105.472635),
      thumbNail:
          'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'),
//   Rubber(
//       name: 'Andrews Coffee Shop',
//       address: '463 7th Ave',
//       description:
//           'All-day American comfort eats in a basic diner-style setting',
//       locationCoords: LatLng(40.751908, -73.989804),
//       thumbNail:
//           'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
//   Rubber(
//       name: 'Third Rail Coffee',
//       address: '240 Sullivan St',
//       description:
//           'Small spot draws serious caffeine lovers with wide selection of brews & baked goods.',
//       locationCoords: LatLng(40.730148, -73.999639),
//       thumbNail:
//           'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
//   Rubber(
//       name: 'Hi-Collar',
//       address: '214 E 10th St',
//       description:
//           'Snazzy, compact Japanese cafe showcasing high-end coffee & sandwiches, plus sake & beer at night.',
//       locationCoords: LatLng(40.729515, -73.985927),
//       thumbNail:
//           'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
//   Rubber(
//       name: 'Everyman Espresso',
//       address: '301 W Broadway',
//       description:
//           'Compact coffee & espresso bar turning out drinks made from direct-trade beans in a low-key setting.',
//       locationCoords: LatLng(40.721622, -74.004308),
//       thumbNail:
//           'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no')
];
