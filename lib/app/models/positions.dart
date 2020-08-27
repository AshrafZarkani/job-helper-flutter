import 'package:flutter/material.dart';
import 'package:job_helper/app/models/github_api.dart';
import 'package:job_helper/app/resorces/jobs_provider.dart';

// a class that extends a ChangeNotifier and notify its
// listeners wither the retrieval is successful or and error occured
class Positions extends ChangeNotifier {
  // an instance from the Job provider class where
  // the request being send to retrieve data
  final _provider = JobsProvider();

  bool _isLoading = false;
  List<GitHubApi> _positions = List(); // an empty list of type GitHubApi to hold the retrieved data
  Map<String,dynamic> _usaPositions; // a map to hold the UsaGovApi to hold the data

  bool get isLoading => _isLoading;
  List<GitHubApi> get positions => List?.from(_positions); // a Getter to the GitHub api list
  Map<String,dynamic> get usaPositions => Map.from(_usaPositions); //// a Getter to the UsaGov api Map

  // get the GitHub positions from the JobsProvider class
  // method (positions) and save them is the _positions list
  // notifying the listeners about the loading state
  Future<void> getPositions() async {
    _isLoading = true;
    notifyListeners();
    try {
      _positions = await _provider.positions();
    } catch (e) {
      print('Failed to get positions');
      _positions = null;
    }
    _isLoading = false;
    notifyListeners();
  }

  // get the UsaGov positions from the JobsProvider class
  // method (usaGovPositions) and save them is the _usaPositions list
  // notifying the listeners about the loading state
  Future<void> getUsaPositions() async {
    _isLoading = true;
    notifyListeners();
    try {
      _usaPositions = await _provider.usaGovPositions();
    } catch (e) {
      print('Failed to get positions');
      _usaPositions = null;
    }
    _isLoading = false;
    notifyListeners();
  }
}
