import 'package:flutter/material.dart';
import 'package:job_helper/app/ui/widgets/prediction_class.dart';

// a search field with google prediction for placec methods in the PredictionClass
Padding searchFiled(BuildContext context, controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.5,
      color: Colors.white,
      child: TextField(
        controller: controller,
        readOnly: true,
        enabled: true,
        onTap: ()=> PredictionClass().getPrediction(context),
        // onSubmitted: (_) => _getLatLng(prediction),
        decoration: InputDecoration(
          suffixIcon: Container(
            width: 10,
            height: 10,
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          hintText: "Search Location",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
        ),
      ),
    ),
  );
}