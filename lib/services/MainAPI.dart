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
      return flightData;
   }

   Future<dynamic> getBuses(String deptCity, String arrivalCity, String deptDate,
       String arrivalDate, String noOfAdults, String noOfChildren, String busClass) async
   {
      var mainUrl = '${mainURL}/buses/${deptCity}/${arrivalCity}/${deptDate}/${arrivalDate}/${noOfAdults}/'
          '${noOfChildren}/${busClass}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var busData = await networkHelper.getData();
      return busData;
   }


   Future<dynamic> getHotels(String arrivalCity, String deptDate,
       String arrivalDate, String noOfAdults, String noOfChildren) async
   {
      var mainUrl = '${mainURL}/hotels/${arrivalCity}/${deptDate}/${arrivalDate}/${noOfAdults}/'
          '${noOfChildren}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var hotelData = await networkHelper.getData();
      return hotelData;
   }

   Future<dynamic> getResorts(String arrivalCity, String deptDate,
       String arrivalDate, String noOfAdults, String noOfChildren) async
   {
      var mainUrl = '${mainURL}/resorts/${arrivalCity}/${deptDate}/${arrivalDate}/${noOfAdults}/'
          '${noOfChildren}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var resortData = await networkHelper.getData();
      return resortData;
   }

   Future<dynamic> getHostels(String arrivalCity, String deptDate,
       String arrivalDate, String noOfAdults, String noOfChildren) async
   {
      var mainUrl = '${mainURL}/hostels/${arrivalCity}/${deptDate}/${arrivalDate}/${noOfAdults}/'
          '${noOfChildren}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var hostelData = await networkHelper.getData();
      return hostelData;
   }


   Future<dynamic> getItinerary(String arrivalCity,List<String>interests,String noOfDays, String totalPeople, String preference) async
   {
      String interestString = interests.join(",");
      var mainUrl = '${mainURL}/itinerary/${arrivalCity}/${interestString}/'
          '${noOfDays}/${totalPeople}/${preference}';
      NetworkHelper networkHelper = NetworkHelper(mainUrl);
      var mainData =  await networkHelper.getData();
      return mainData;
   }


}