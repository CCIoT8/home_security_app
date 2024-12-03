import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'constants.dart';

class ApiService {

  // GET ARMED STATE
  Future<String?> getCurrentState() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.stateEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        log('Response received: ${response.body}');
        var data = jsonDecode(response.body);
        bool isArmed = data['state']['armed'];
        return isArmed == true ? 'ARMED' : 'DISARMED';
      } else {
        log('Error: Received status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Exception occurred: $e');
      return null;
    }
  }

  // ARM SYSTEM
  Future<bool> armSystem() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.armEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        log('System armed successfully.');
        return true;
      } else {
        log('Failed to arm system. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log('Exception occurred: $e');
      return false;
    }
  }

  // DISARM SYSTEM
  Future<bool> disarmSystem() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.disarmEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        log('System disarmed successfully.');
        return true;
      } else {
        log('Failed to disarm system. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log('Exception occurred: $e');
      return false;
    }
  }

  // CHECK ALARM
  Future<bool?> checkAlarm() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.stateEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        log('Response received: ${response.body}');
        var data = jsonDecode(response.body);
        bool isTriggered = data['state']['alarmTriggered'];
        return isTriggered;
      } else {
        log('Error: Received status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Exception occurred: $e');
      return null;
    }
  }

  // GET IMAGE
  Future<Map<String, dynamic>?> getImage() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.alarmEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log("Error fetching alarm condition: $e");
      return null;
    }
  }

  // STOP ALARM
  Future<bool> stopAlarm() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.stopAlarmEndpoint);
      var response = await http.post(url);

      if (response.statusCode == 200) {
        log('System disarmed successfully.');
        return true;
      } else {
        log('Failed to disarm system. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log('Exception occurred: $e');
      return false;
    }
  }

}
