import 'dart:convert';

// a class to retrieve the UsaJobApi


UsaGovApi usaGovFromJson(String str) => UsaGovApi.fromJson(json.decode(str));

String usaGovToJson(UsaGovApi data) => json.encode(data.toJson());

class UsaGovApi {
  UsaGovApi({
    this.languageCode,
    this.searchParameters,
    this.searchResult,
  });

  String languageCode;
  SearchParameters searchParameters;
  SearchResult searchResult;

  factory UsaGovApi.fromJson(Map<String, dynamic> json) => UsaGovApi(
        languageCode: json["LanguageCode"],
        searchParameters: SearchParameters.fromJson(json["SearchParameters"]),
        searchResult: SearchResult.fromJson(json["SearchResult"]),
      );

  Map<String, dynamic> toJson() => {
        "LanguageCode": languageCode,
        "SearchParameters": searchParameters.toJson(),
        "SearchResult": searchResult.toJson(),
      };
}

class SearchParameters {
  SearchParameters();

  factory SearchParameters.fromJson(Map<String, dynamic> json) =>
      SearchParameters();

  Map<String, dynamic> toJson() => {};
}

class SearchResult {
  SearchResult({
    this.searchResultCount,
    this.searchResultCountAll,
    this.searchResultItems,
    this.userArea,
  });

  int searchResultCount;
  int searchResultCountAll;
  List<SearchResultItem> searchResultItems;
  SearchResultUserArea userArea;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        searchResultCount: json["SearchResultCount"],
        searchResultCountAll: json["SearchResultCountAll"],
        searchResultItems: List<SearchResultItem>.from(
            json["SearchResultItems"].map((x) => SearchResultItem.fromJson(x))),
        userArea: SearchResultUserArea.fromJson(json["UserArea"]),
      );

  Map<String, dynamic> toJson() => {
        "SearchResultCount": searchResultCount,
        "SearchResultCountAll": searchResultCountAll,
        "SearchResultItems":
            List<dynamic>.from(searchResultItems.map((x) => x.toJson())),
        "UserArea": userArea.toJson(),
      };
}

class SearchResultItem {
  SearchResultItem({
    this.matchedObjectId,
    this.matchedObjectDescriptor,
    this.relevanceRank,
  });

  String matchedObjectId;
  List<MatchedObjectDescriptor> matchedObjectDescriptor;
  int relevanceRank;

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      SearchResultItem(
        matchedObjectId: json["MatchedObjectId"],
        matchedObjectDescriptor:
            List<MatchedObjectDescriptor>.from(
            json["MatchedObjectDescriptor"].map((x) => SearchResultItem.fromJson(x))),
        relevanceRank: json["RelevanceRank"],
      );

  Map<String, dynamic> toJson() => {
        "MatchedObjectId": matchedObjectId,
        "MatchedObjectDescriptor":List<dynamic>.from(matchedObjectDescriptor.map((x) => x.toJson())),

        "RelevanceRank": relevanceRank,
      };
}

class MatchedObjectDescriptor {
  MatchedObjectDescriptor({
    this.positionId,
    this.positionTitle,
    this.positionUri,
    this.applyUri,
    this.positionLocationDisplay,
    this.positionLocation,
    this.organizationName,
    this.departmentName,
    this.jobCategory,
    this.jobGrade,
    this.positionSchedule,
    this.positionOfferingType,
    this.qualificationSummary,
    this.positionRemuneration,
    this.positionStartDate,
    this.positionEndDate,
    this.publicationStartDate,
    this.applicationCloseDate,
    this.positionFormattedDescription,
    this.userArea,
    this.subAgency,
  });

  String positionId;
  String positionTitle;
  String positionUri;
  List<String> applyUri;
  String positionLocationDisplay;
  List<PositionLocation> positionLocation;
  String organizationName;
  String departmentName;
  List<JobCategory> jobCategory;
  List<JobGrade> jobGrade;
  List<JobCategory> positionSchedule;
  List<JobCategory> positionOfferingType;
  String qualificationSummary;
  List<PositionRemuneration> positionRemuneration;
  DateTime positionStartDate;
  DateTime positionEndDate;
  DateTime publicationStartDate;
  DateTime applicationCloseDate;
  List<PositionFormattedDescription> positionFormattedDescription;
  MatchedObjectDescriptorUserArea userArea;
  String subAgency;

  MatchedObjectDescriptor.fromJson(Map<String, dynamic> json) {
    positionId = json["PositionID"];
    positionTitle = json["PositionTitle"];
    positionUri = json["PositionURI"];
    applyUri = List<String>.from(json["ApplyURI"].map((x) => x));
    positionLocationDisplay = json["PositionLocationDisplay"];
    positionLocation = List<PositionLocation>.from(
        json["PositionLocation"].map((x) => PositionLocation.fromJson(x)));
    organizationName = json["OrganizationName"];
    departmentName = json["DepartmentName"];
    jobCategory = List<JobCategory>.from(
        json["JobCategory"].map((x) => JobCategory.fromJson(x)));
    jobGrade =
        List<JobGrade>.from(json["JobGrade"].map((x) => JobGrade.fromJson(x)));
    positionSchedule = List<JobCategory>.from(
        json["PositionSchedule"].map((x) => JobCategory.fromJson(x)));
    positionOfferingType = List<JobCategory>.from(
        json["PositionOfferingType"].map((x) => JobCategory.fromJson(x)));
    qualificationSummary = json["QualificationSummary"];
    positionRemuneration = List<PositionRemuneration>.from(
        json["PositionRemuneration"]
            .map((x) => PositionRemuneration.fromJson(x)));
    positionStartDate = DateTime.parse(json["PositionStartDate"]);
    positionEndDate = DateTime.parse(json["PositionEndDate"]);
    publicationStartDate = DateTime.parse(json["PublicationStartDate"]);
    applicationCloseDate = DateTime.parse(json["ApplicationCloseDate"]);
    positionFormattedDescription = List<PositionFormattedDescription>.from(
        json["PositionFormattedDescription"]
            .map((x) => PositionFormattedDescription.fromJson(x)));
    userArea = MatchedObjectDescriptorUserArea.fromJson(json["UserArea"]);
    subAgency = json["SubAgency"] == null ? null : json["SubAgency"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["PositionID"] = this.positionId;
    data["PositionTitle"] = positionTitle;
    data["PositionURI"] = positionUri;
    data["ApplyURI"] = List<dynamic>.from(this.applyUri.map((x) => x));
    data["PositionLocationDisplay"] = this.positionLocationDisplay;
    data["PositionLocation"] =
        List<dynamic>.from(this.positionLocation.map((x) => x.toJson()));
    data["OrganizationName"] = this.organizationName;
    data["DepartmentName"] = this.departmentName;
    data["JobCategory"] =
        List<dynamic>.from(this.jobCategory.map((x) => x.toJson()));
    data["JobGrade"] = List<dynamic>.from(this.jobGrade.map((x) => x.toJson()));
    data["PositionSchedule"] =
        List<dynamic>.from(this.positionSchedule.map((x) => x.toJson()));
    data["PositionOfferingType"] =
        List<dynamic>.from(this.positionOfferingType.map((x) => x.toJson()));
    data["QualificationSummary"] = this.qualificationSummary;
    data["PositionRemuneration"] =
        List<dynamic>.from(this.positionRemuneration.map((x) => x.toJson()));
    data["PositionStartDate"] =
        "${this.positionStartDate.year.toString().padLeft(4, '0')}-${this.positionStartDate.month.toString().padLeft(2, '0')}-${this.positionStartDate.day.toString().padLeft(2, '0')}";
    data["PositionEndDate"] =
        "${this.positionEndDate.year.toString().padLeft(4, '0')}-${this.positionEndDate.month.toString().padLeft(2, '0')}-${this.positionEndDate.day.toString().padLeft(2, '0')}";
    data["PublicationStartDate"] =
        "${this.publicationStartDate.year.toString().padLeft(4, '0')}-${this.publicationStartDate.month.toString().padLeft(2, '0')}-${this.publicationStartDate.day.toString().padLeft(2, '0')}";
    data["ApplicationCloseDate"] =
        "${this.applicationCloseDate.year.toString().padLeft(4, '0')}-${this.applicationCloseDate.month.toString().padLeft(2, '0')}-${this.applicationCloseDate.day.toString().padLeft(2, '0')}";
    data["PositionFormattedDescription"] = List<dynamic>.from(
        this.positionFormattedDescription.map((x) => x.toJson()));
    data["UserArea"] = this.userArea.toJson();
    data["SubAgency"] = this.subAgency == null ? null : this.subAgency;
    return data;
  }
}

class JobCategory {
  JobCategory({
    this.name,
    this.code,
  });

  String name;
  String code;

  factory JobCategory.fromJson(Map<String, dynamic> json) => JobCategory(
        name: json["Name"],
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Code": code,
      };
}

class JobGrade {
  JobGrade({
    this.code,
  });

  String code;

  factory JobGrade.fromJson(Map<String, dynamic> json) => JobGrade(
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
      };
}

class PositionFormattedDescription {
  PositionFormattedDescription({
    this.label,
    this.labelDescription,
  });

  Label label;
  LabelDescription labelDescription;

  factory PositionFormattedDescription.fromJson(Map<String, dynamic> json) =>
      PositionFormattedDescription(
        label: labelValues.map[json["Label"]],
        labelDescription: labelDescriptionValues.map[json["LabelDescription"]],
      );

  Map<String, dynamic> toJson() => {
        "Label": labelValues.reverse[label],
        "LabelDescription": labelDescriptionValues.reverse[labelDescription],
      };
}

enum Label { DYNAMIC_TEASER }

final labelValues = EnumValues({"Dynamic Teaser": Label.DYNAMIC_TEASER});

enum LabelDescription { HIT_HIGHLIGHTING_FOR_KEYWORD_SEARCHES }

final labelDescriptionValues = EnumValues({
  "Hit highlighting for keyword searches.":
      LabelDescription.HIT_HIGHLIGHTING_FOR_KEYWORD_SEARCHES
});

class PositionLocation {
  PositionLocation({
    this.locationName,
    this.countryCode,
    this.countrySubDivisionCode,
    this.cityName,
    this.longitude,
    this.latitude,
  });

  String locationName;
  CountryCode countryCode;
  String countrySubDivisionCode;
  String cityName;
  double longitude;
  double latitude;

  factory PositionLocation.fromJson(Map<String, dynamic> json) =>
      PositionLocation(
        locationName: json["LocationName"],
        countryCode: countryCodeValues.map[json["CountryCode"]],
        countrySubDivisionCode: json["CountrySubDivisionCode"] == null
            ? null
            : json["CountrySubDivisionCode"],
        cityName: json["CityName"],
        longitude: json["Longitude"].toDouble(),
        latitude: json["Latitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "LocationName": locationName,
        "CountryCode": countryCodeValues.reverse[countryCode],
        "CountrySubDivisionCode":
            countrySubDivisionCode == null ? null : countrySubDivisionCode,
        "CityName": cityName,
        "Longitude": longitude,
        "Latitude": latitude,
      };
}

enum CountryCode { UNITED_STATES, GERMANY }

final countryCodeValues = EnumValues({
  "Germany": CountryCode.GERMANY,
  "United States": CountryCode.UNITED_STATES
});

class PositionRemuneration {
  PositionRemuneration({
    this.minimumRange,
    this.maximumRange,
    this.rateIntervalCode,
  });

  String minimumRange;
  String maximumRange;
  RateIntervalCode rateIntervalCode;

  factory PositionRemuneration.fromJson(Map<String, dynamic> json) =>
      PositionRemuneration(
        minimumRange: json["MinimumRange"],
        maximumRange: json["MaximumRange"],
        rateIntervalCode: rateIntervalCodeValues.map[json["RateIntervalCode"]],
      );

  Map<String, dynamic> toJson() => {
        "MinimumRange": minimumRange,
        "MaximumRange": maximumRange,
        "RateIntervalCode": rateIntervalCodeValues.reverse[rateIntervalCode],
      };
}

enum RateIntervalCode { PER_YEAR, PER_HOUR }

final rateIntervalCodeValues = EnumValues({
  "Per Hour": RateIntervalCode.PER_HOUR,
  "Per Year": RateIntervalCode.PER_YEAR
});

class MatchedObjectDescriptorUserArea {
  MatchedObjectDescriptorUserArea({
    this.details,
    this.isRadialSearch,
  });

  Details details;
  bool isRadialSearch;

  factory MatchedObjectDescriptorUserArea.fromJson(Map<String, dynamic> json) =>
      MatchedObjectDescriptorUserArea(
        details: Details.fromJson(json["Details"]),
        isRadialSearch: json["IsRadialSearch"],
      );

  Map<String, dynamic> toJson() => {
        "Details": details.toJson(),
        "IsRadialSearch": isRadialSearch,
      };
}

class Details {
  Details({
    this.majorDuties,
    this.education,
    this.requirements,
    this.evaluations,
    this.howToApply,
    this.whatToExpectNext,
    this.requiredDocuments,
    this.benefits,
    this.otherInformation,
    this.keyRequirements,
    this.withinArea,
    this.commuteDistance,
    this.serviceType,
    this.announcementClosingType,
    this.agencyContactEmail,
    this.agencyContactPhone,
    this.securityClearance,
    this.drugTestRequired,
    this.positionSensitivitiy,
    this.adjudicationType,
    this.jobSummary,
    this.whoMayApply,
    this.lowGrade,
    this.highGrade,
    this.organizationCodes,
    this.relocation,
    this.hiringPath,
    this.totalOpenings,
    this.agencyMarketingStatement,
    this.travelCode,
    this.applyOnlineUrl,
    this.detailStatusUrl,
    this.subAgencyName,
    this.announcementClosingTypeOption,
    this.secondAnnouncementUrl,
    this.mcoTags,
  });

  List<String> majorDuties;
  String education;
  String requirements;
  String evaluations;
  String howToApply;
  String whatToExpectNext;
  String requiredDocuments;
  String benefits;
  String otherInformation;
  List<dynamic> keyRequirements;
  DrugTestRequired withinArea;
  String commuteDistance;
  String serviceType;
  String announcementClosingType;
  String agencyContactEmail;
  String agencyContactPhone;
  SecurityClearance securityClearance;
  DrugTestRequired drugTestRequired;
  PositionSensitivitiy positionSensitivitiy;
  List<AdjudicationType> adjudicationType;
  String jobSummary;
  JobCategory whoMayApply;
  String lowGrade;
  String highGrade;
  String organizationCodes;
  DrugTestRequired relocation;
  List<String> hiringPath;
  String totalOpenings;
  String agencyMarketingStatement;
  String travelCode;
  String applyOnlineUrl;
  String detailStatusUrl;
  String subAgencyName;
  String announcementClosingTypeOption;
  String secondAnnouncementUrl;
  List<String> mcoTags;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        majorDuties: List<String>.from(json["MajorDuties"].map((x) => x)),
        education: json["Education"],
        requirements: json["Requirements"],
        evaluations: json["Evaluations"],
        howToApply: json["HowToApply"],
        whatToExpectNext: json["WhatToExpectNext"],
        requiredDocuments: json["RequiredDocuments"],
        benefits: json["Benefits"],
        otherInformation: json["OtherInformation"],
        keyRequirements:
            List<dynamic>.from(json["KeyRequirements"].map((x) => x)),
        withinArea: drugTestRequiredValues.map[json["WithinArea"]],
        commuteDistance: json["CommuteDistance"],
        serviceType: json["ServiceType"],
        announcementClosingType: json["AnnouncementClosingType"],
        agencyContactEmail: json["AgencyContactEmail"],
        agencyContactPhone: json["AgencyContactPhone"] == null
            ? null
            : json["AgencyContactPhone"],
        securityClearance:
            securityClearanceValues.map[json["SecurityClearance"]],
        drugTestRequired: drugTestRequiredValues.map[json["DrugTestRequired"]],
        positionSensitivitiy: json["PositionSensitivitiy"] == null
            ? null
            : positionSensitivitiyValues.map[json["PositionSensitivitiy"]],
        adjudicationType: List<AdjudicationType>.from(
            json["AdjudicationType"].map((x) => adjudicationTypeValues.map[x])),
        jobSummary: json["JobSummary"],
        whoMayApply: JobCategory.fromJson(json["WhoMayApply"]),
        lowGrade: json["LowGrade"],
        highGrade: json["HighGrade"],
        organizationCodes: json["OrganizationCodes"],
        relocation: drugTestRequiredValues.map[json["Relocation"]],
        hiringPath: List<String>.from(json["HiringPath"].map((x) => x)),
        totalOpenings:
            json["TotalOpenings"] == null ? null : json["TotalOpenings"],
        agencyMarketingStatement: json["AgencyMarketingStatement"],
        travelCode: json["TravelCode"],
        applyOnlineUrl:
            json["ApplyOnlineUrl"] == null ? null : json["ApplyOnlineUrl"],
        detailStatusUrl:
            json["DetailStatusUrl"] == null ? null : json["DetailStatusUrl"],
        subAgencyName:
            json["SubAgencyName"] == null ? null : json["SubAgencyName"],
        announcementClosingTypeOption:
            json["AnnouncementClosingTypeOption"] == null
                ? null
                : json["AnnouncementClosingTypeOption"],
        secondAnnouncementUrl: json["SecondAnnouncementUrl"] == null
            ? null
            : json["SecondAnnouncementUrl"],
        mcoTags: json["MCOTags"] == null
            ? null
            : List<String>.from(json["MCOTags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "MajorDuties": List<dynamic>.from(majorDuties.map((x) => x)),
        "Education": education,
        "Requirements": requirements,
        "Evaluations": evaluations,
        "HowToApply": howToApply,
        "WhatToExpectNext": whatToExpectNext,
        "RequiredDocuments": requiredDocuments,
        "Benefits": benefits,
        "OtherInformation": otherInformation,
        "KeyRequirements": List<dynamic>.from(keyRequirements.map((x) => x)),
        "WithinArea": drugTestRequiredValues.reverse[withinArea],
        "CommuteDistance": commuteDistance,
        "ServiceType": serviceType,
        "AnnouncementClosingType": announcementClosingType,
        "AgencyContactEmail": agencyContactEmail,
        "AgencyContactPhone":
            agencyContactPhone == null ? null : agencyContactPhone,
        "SecurityClearance": securityClearanceValues.reverse[securityClearance],
        "DrugTestRequired": drugTestRequiredValues.reverse[drugTestRequired],
        "PositionSensitivitiy": positionSensitivitiy == null
            ? null
            : positionSensitivitiyValues.reverse[positionSensitivitiy],
        "AdjudicationType": List<dynamic>.from(
            adjudicationType.map((x) => adjudicationTypeValues.reverse[x])),
        "JobSummary": jobSummary,
        "WhoMayApply": whoMayApply.toJson(),
        "LowGrade": lowGrade,
        "HighGrade": highGrade,
        "OrganizationCodes": organizationCodes,
        "Relocation": drugTestRequiredValues.reverse[relocation],
        "HiringPath": List<dynamic>.from(hiringPath.map((x) => x)),
        "TotalOpenings": totalOpenings == null ? null : totalOpenings,
        "AgencyMarketingStatement": agencyMarketingStatement,
        "TravelCode": travelCode,
        "ApplyOnlineUrl": applyOnlineUrl == null ? null : applyOnlineUrl,
        "DetailStatusUrl": detailStatusUrl == null ? null : detailStatusUrl,
        "SubAgencyName": subAgencyName == null ? null : subAgencyName,
        "AnnouncementClosingTypeOption": announcementClosingTypeOption == null
            ? null
            : announcementClosingTypeOption,
        "SecondAnnouncementUrl":
            secondAnnouncementUrl == null ? null : secondAnnouncementUrl,
        "MCOTags":
            mcoTags == null ? null : List<dynamic>.from(mcoTags.map((x) => x)),
      };
}

enum AdjudicationType { SUITABILITY_FITNESS }

final adjudicationTypeValues =
    EnumValues({"Suitability/Fitness": AdjudicationType.SUITABILITY_FITNESS});

enum DrugTestRequired { FALSE, TRUE }

final drugTestRequiredValues = EnumValues(
    {"False": DrugTestRequired.FALSE, "True": DrugTestRequired.TRUE});

enum PositionSensitivitiy {
  MODERATE_RISK_MR,
  HIGH_RISK_HR,
  NON_SENSITIVE_NS_LOW_RISK
}

final positionSensitivitiyValues = EnumValues({
  "High Risk (HR)": PositionSensitivitiy.HIGH_RISK_HR,
  "Moderate Risk (MR)": PositionSensitivitiy.MODERATE_RISK_MR,
  "Non-sensitive (NS)/Low Risk": PositionSensitivitiy.NON_SENSITIVE_NS_LOW_RISK
});

enum SecurityClearance { NOT_REQUIRED, OTHER, SECRET }

final securityClearanceValues = EnumValues({
  "Not Required": SecurityClearance.NOT_REQUIRED,
  "Other": SecurityClearance.OTHER,
  "Secret": SecurityClearance.SECRET
});

class SearchResultUserArea {
  SearchResultUserArea({
    this.numberOfPages,
    this.isRadialSearch,
  });

  String numberOfPages;
  bool isRadialSearch;

  factory SearchResultUserArea.fromJson(Map<String, dynamic> json) =>
      SearchResultUserArea(
        numberOfPages: json["NumberOfPages"],
        isRadialSearch: json["IsRadialSearch"],
      );

  Map<String, dynamic> toJson() => {
        "NumberOfPages": numberOfPages,
        "IsRadialSearch": isRadialSearch,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
