import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_helper/app/models/github_api.dart';
import 'package:job_helper/app/services/api_keys.dart';

class JobsProvider {
  // url to cal the github api
  final _baseUrl = 'https://jobs.github.com';
  // url to call usagov api
  final _usaGovBaseUrl = "https://data.usajobs.gov";

  // method positions to request the data from github api
  Future<List<GitHubApi>> positions() async {
    final response = await http.get('$_baseUrl/positions.json');
    return _handleGetHubResponse(response);
  }

  // method positions to request the data from usagov api
  Future<Map<String,dynamic>> usaGovPositions() async {
    final response = await http.get('$_usaGovBaseUrl/api/search', headers: {
      "Content-Type": 'application/json',
      "Host": 'data.usajobs.gov',
      "User-Agent": 'jobhelperinterview@gmail.com',
      "Authorization-Key": APIKeys.usaJobsKey,
    });
    return _handleUsaGovResponse(response);
  }

  // handle the retrieved data from github api and decode the json to a list
  _handleGetHubResponse(response, {String error}) {
    if (response.statusCode == 200) {
      List<GitHubApi> returnedGitHubData = (json.decode(response.body) as List)
          .map((e) => GitHubApi.fromJson(e))
          .toList();
      return returnedGitHubData;
    } else {
      throw error ?? 'Failed to get positions';
    }
  }

  // handle the response from usagov api and decode the json
  _handleUsaGovResponse(response, {String error}) {
    if (response.statusCode == 200) {
        return (json.decode(response.body));
    } else {
      throw error ?? 'Failed to get positions';
    }
  }
}
