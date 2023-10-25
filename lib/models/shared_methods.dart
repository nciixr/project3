
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:pspots/models/locations_model.dart';



Future<List<LocationModel>> getLocations()
async {
  List<LocationModel> locationList = [];
  try
  {
    String uri = "https://nga.myquotas.com/NGA/GDN?storedProcedureName=dbo.pSpotDb_sp_GetLocations&conncectionStringInWebConfig=pSpotconnection";
    List userData = [];
    Uri finalUri = Uri.parse(uri);
    await http.post(finalUri, body:{}
    ).then((value) async {
      userData = jsonDecode(value.body);
      if(userData.isNotEmpty)
        {
for(int i = 0;i<userData.length;i++) {
  locationList.add( LocationModel(locationId: int.parse(userData[i]["R1"]), locationName:  userData[i]["R2"], locationOnMap:  userData[i]["R3"], locationLogo:  'assets/images/${userData[i]["R4"]}', locationCapacity: double.parse( userData[i]["R5"]), locationAvailableSpots: double.parse( userData[i]["R6"])));
}
        }


    });
    return locationList;
  }
  catch(ex)
  {
    return locationList;
  }
}

  Future<List<FloorModel>> getLocationFloors(int locationNo)
  async {
    List<FloorModel> floorsList = [];
    try
    {

       String uri = "https://nga.myquotas.com/NGA/GDN?storedProcedureName=dbo.pSpotDb_sp_GetLocationsFloor&conncectionStringInWebConfig=pSpotconnection";

      List userData = [];
      Uri finalUri = Uri.parse(uri);
      await http.post(finalUri, body: {
        'P1': '@locationId',
        'PV1': locationNo.toString(),

      }
      ).then((value) async {
        userData = jsonDecode(value.body);
        if(userData.isNotEmpty)
          {
            for(int i = 0;i < userData.length;i++)
              {
                floorsList.add(FloorModel(floorId: int.parse(userData[i]["R1"]), floorDescription:  userData[i]["R2"], floorCapacity: int.parse(userData[i]["R3"]),
                    floorAvailableSpots:   int.parse(userData[i]["R4"]), floorLocationNo:  locationNo));
              }
          }
      });

      return floorsList;
    }
    catch(ex)
    {
      return floorsList;
    }
  }

  Future<List<SectionModel>> getFloorSections(int floorNo)
  async {
    List<SectionModel> sectionsList = [];
    try
    {

       String uri = "https://nga.myquotas.com/NGA/GDN?storedProcedureName=dbo.pSpotDb_sp_GetFloorSections&conncectionStringInWebConfig=pSpotconnection";

      List userData = [];
      Uri finalUri = Uri.parse(uri);
      await http.post(finalUri, body: {
        'P1': '@floorId',
        'PV1': floorNo.toString(),

      }
      ).then((value) async {
        userData = jsonDecode(value.body);
        if(userData.isNotEmpty)
          {
            for(int i = 0;i < userData.length;i++)
              {
                sectionsList.add(SectionModel(sectionId: int.parse(userData[i]["R1"]), sectionDescription:  userData[i]["R2"], sectionCapacity: int.parse(userData[i]["R3"]),
                    sectionAvailableSpots:   int.parse(userData[i]["R4"]), sectionFloorNo:  floorNo));

              }
          }
      });

      return sectionsList;
    }
    catch(ex)
    {
      return sectionsList;
    }
  }


Future<Null> updated(StateSetter updateState) async {
  updateState(() {});
}


Future<List<ParkingSpotModel>> reserveParkingSlot(int parkingSpotId)
async {
  List<ParkingSpotModel> parkingSpotsList = [];
  try
  {

    String uri = "https://nga.myquotas.com/NGA/GDN?storedProcedureName=dbo.pSpot_sp_ReservParkingSpot&conncectionStringInWebConfig=pSpotconnection";

    List userData = [];
    Uri finalUri = Uri.parse(uri);
    await http.post(finalUri, body: {
      'P1': '@parkingSpotId',
      'PV1': parkingSpotId.toString(),

    }
    ).then((value) async {
      userData = jsonDecode(value.body);
      if(userData.isNotEmpty)
      {
        for(int i = 0;i < userData.length;i++)
        {
          parkingSpotsList.add(ParkingSpotModel(parkingSpotId: int.parse(userData[i]["R1"]), parkingSpotDescription:  userData[i]["R2"],
              parkingSpotStatus: userData[i]["R3"].toString() == 'yes'? true:false, parkingSpotDirection:   userData[i]["R4"],isSNSpot: userData[i]["R5"],
              parkingSpotSectionNo:  parkingSpotId,isSelected: false));
        }
      }
    });

    return parkingSpotsList;
  }
  catch(ex)
  {
    return parkingSpotsList;
  }
}


  Future<List<ParkingSpotModel>> getSectionParkingSpots(int sectionNo)
  async {
    List<ParkingSpotModel> parkingSpotsList = [];
    try
    {

       String uri = "https://nga.myquotas.com/NGA/GDN?storedProcedureName=dbo.pSpotDb_sp_GetSectionParkingSpots&conncectionStringInWebConfig=pSpotconnection";

      List userData = [];
      Uri finalUri = Uri.parse(uri);
      await http.post(finalUri, body: {
        'P1': '@sectionId',
        'PV1': sectionNo.toString(),

      }
      ).then((value) async {
        userData = jsonDecode(value.body);
        if(userData.isNotEmpty)
          {
            for(int i = 0;i < userData.length;i++)
              {
                parkingSpotsList.add(ParkingSpotModel(parkingSpotId: int.parse(userData[i]["R1"]), parkingSpotDescription:  userData[i]["R2"],
                    parkingSpotStatus: userData[i]["R3"].toString() == 'yes'? true:false, parkingSpotDirection:   userData[i]["R4"],isSNSpot: userData[i]["R5"],
                    parkingSpotSectionNo:  sectionNo,isSelected: false));
              }
          }
      });

      return parkingSpotsList;
    }
    catch(ex)
    {
      return parkingSpotsList;
    }
  }



String codeConnectionStr(String conStr)
{

  //if (conStr.length < 6)
  //{
  //    return "Error... Unable to code the string";
  //}
  String allChars = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-_+=/\\*&%^\$#@!~;,{}<>()|'`:.ابتثجحخدذرزسشصضطظعغفقكلمنهوءيئةؤىأإًٌٍَُِّ\"[]";
  int s;
  String ResultStr;
  ResultStr = "";// "s999999b";
  int l = conStr.length;
  int m = l - 1;
  String curChar, tempStr;

  tempStr = "";

  Random rnd = new Random();
  for (int chrPos = 0; chrPos < l; chrPos++)
  {

    if (chrPos % 2 != 0)
    {

      curChar = conStr.substring(m, m+1);
      m -= 2;

    }
    else
    {
      if (m == 0)
      {
        curChar = conStr.substring(m, m+1);
      }
      else
      {
        curChar = conStr.substring(m - 1, m);
      }


    }

    s = allChars.indexOf(curChar);


    if (s == -1)
    {
      return "Error coding the string";
    }
    tempStr += curChar;

    int rndNo = rnd.nextInt(26) + 1;
    String t = s.toString() + allChars.substring(rndNo, rndNo + 1);
    ResultStr += t;
  }



  return createRandomText(12) + ResultStr + "d90901230g" + createRandomText(ResultStr.length);

}


String decodeConnectionStr(String conStr)

{

  String allChars = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-_+=/\\*&%^\$#@!~;,{}<>()|'`:.ابتثجحخدذرزسشصضطظعغفقكلمنهوءيئةؤىأإًٌٍَُِّ\"[]";
  String subChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  String strToDecode = conStr.substring(12, conStr.indexOf("d90901230g") );

  String curChar, curNo, resultStr;
  curNo = "";
  curChar = "";
  resultStr = "";
  for (int i = 0; i < strToDecode.length; i++)
  {
    if (subChars.contains(strToDecode.substring(i, i+1)))
    {
      if (curNo.length != 0)
      {
        resultStr += allChars.substring(int.parse(curNo), int.parse(curNo) + 1);
        curNo = "";

      }
      else
        curNo += strToDecode.substring(i, i+1);
    }
    else
    {
      curNo += strToDecode.substring(i, i+1);
    }
  }
  curChar = "";
  String finalStr = "";
  int L = resultStr.length - 1;
  int curPos = 0;
  bool isOdd;
  if (resultStr.length % 2 == 0)
  {
    isOdd = false;
  }
  else
  {
    isOdd = true;
    resultStr += resultStr.substring(L, L + 1);
    L++;
  }
  int lastPos = L;

  for (int j = L; j >= 0; j--)
  {

    if (j == L)
    {
      curChar = resultStr.substring(lastPos - 1, lastPos);


    }
    else if (curPos % 2 == 0)
    {
      if (lastPos != 0)
      {
        curChar = resultStr.substring(lastPos - 1, lastPos);
      }
      else
      {
        curChar = resultStr.substring(lastPos,lastPos + 1);
      }


    }
    else
    {
      if (lastPos > 0)
      {
        curChar = resultStr.substring(lastPos, lastPos + 1);
        lastPos -= 2;
      }
      else
      {
        curChar = resultStr.substring(0, 1);
      }

    }
    curPos++;
    finalStr += curChar;
  }
  //finalStr = finalStr.substring(1, finalStr.length - 1);
  //finalStr = finalStr.Replace(",", ";");
  if (isOdd)
  {
    return finalStr.substring(1, finalStr.length - 1);
  }
  else
  {
    return finalStr;
  }
}

String createRandomText(int noOfChars)
{
String returnedStr ="";
String allChars = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-_=*^!~|:.";
int curIdx;
for(int i = 1;i<=noOfChars;i++)
{
Random rnd = new Random();
curIdx = rnd.nextInt(allChars.length - 2);
returnedStr = returnedStr + allChars.substring(curIdx,curIdx+1);
}

return returnedStr;
}
