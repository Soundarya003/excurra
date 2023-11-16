import 'dart:ui';

import 'package:excurra/services/networking.dart';

const mainURL = 'https://930d-117-213-200-2.ngrok-free.app/excurra';

class MainAPI {
   Future<dynamic> getTrain(String deptCity, String arrivalCity, String deptDate,
       String arrivalDate, String noOfAdults, String noOfChildren, String trainClass) async
   {
      var mainUrl = '${mainURL}/trains/${deptCity}/${arrivalCity}/${deptDate}/${arrivalDate}/${noOfAdults}/'
          '${noOfChildren}/${trainClass}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var trainData = await networkHelper.getData();
      return trainData;
   }

   Future<dynamic> getFlight(String deptCity, String arrivalCity, String deptDate,
       String arrivalDate, String noOfAdults, String noOfChildren, String flightClass) async
   {
      var mainUrl = '${mainURL}/flights/${deptCity}/${arrivalCity}/${deptDate}/${arrivalDate}/${noOfAdults}/'
          '${noOfChildren}/${flightClass}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var flightData = await networkHelper.getData();
      print(mainUrl);
      print(flightData);
      return flightData;
   }

   Future<dynamic> getBuses(String deptCity, String arrivalCity, String deptDate,
       String arrivalDate, String noOfAdults, String noOfChildren, String busClass) async
   {
      var mainUrl = '${mainURL}/buses/${deptCity}/${arrivalCity}/${deptDate}/${arrivalDate}/${noOfAdults}/'
          '${noOfChildren}/${busClass}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var busData = await networkHelper.getData();
      print(mainUrl);
      print(busData);
      return busData;
   }


   Future<dynamic> getHotels(String arrivalCity, String deptDate,
       String arrivalDate, String noOfAdults, String noOfChildren) async
   {
      var mainUrl = '${mainURL}/hotels/${arrivalCity}/${deptDate}/${arrivalDate}/${noOfAdults}/'
          '${noOfChildren}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var hotelData = await networkHelper.getData();
      print(mainUrl);
      return hotelData;
   }

   Future<dynamic> getResorts(String arrivalCity, String deptDate,
       String arrivalDate, String noOfAdults, String noOfChildren) async
   {
      var mainUrl = '${mainURL}/resorts/${arrivalCity}/${deptDate}/${arrivalDate}/${noOfAdults}/'
          '${noOfChildren}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var resortData = await networkHelper.getData();
      print(mainUrl);
      return resortData;
   }

   Future<dynamic> getHostels(String arrivalCity, String deptDate,
       String arrivalDate, String noOfAdults, String noOfChildren) async
   {
      var mainUrl = '${mainURL}/hostels/${arrivalCity}/${deptDate}/${arrivalDate}/${noOfAdults}/'
          '${noOfChildren}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var hostelData = await networkHelper.getData();
      print(mainUrl);
      return hostelData;
   }


   Future<dynamic> getItinerary() async
   {
      NetworkHelper networkHelper = NetworkHelper('https://c91f-117-213-200-2.ngrok-free.app/excurra/itinerary/Delhi/Adventure,Shopping,Temples/3/2/Friends');
      var mainData =  await networkHelper.getData();
      return mainData;
   }


}