import 'dart:convert';

import 'package:amrtmm_project/app/dashboard/domain/entities/dashboard_summary_entity.dart';

class DashboardSummaryModel extends DashboardSummaryEntity {
  const DashboardSummaryModel({
    required double pendingAmount,
    required double incomeAmount,
    required double paidAmount,
  }) : super(
          pendingAmount: pendingAmount,
          incomeAmount: incomeAmount,
          paidAmount: paidAmount,
        );

  // Factory method to create a model from JSON
  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) {
    return DashboardSummaryModel(
      pendingAmount: double.tryParse(json['pending_amount'] ?? '0.00') ?? 0.00,
      incomeAmount: double.tryParse(json['income_amount'] ?? '0.00') ?? 0.00,
      paidAmount: double.tryParse(json['paid_amount'] ?? '0.00') ?? 0.00,
    );
  }

  // Method to convert model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'pending_amount': pendingAmount.toStringAsFixed(2),
      'income_amount': incomeAmount.toStringAsFixed(2),
      'paid_amount': paidAmount.toStringAsFixed(2),
    };
  }

  DashboardSummaryEntity toEntity() {
    return DashboardSummaryEntity(
      pendingAmount: pendingAmount,
      incomeAmount: incomeAmount,
      paidAmount: paidAmount,
    );
  }
}

class DashboardSummaryResponse {
  final bool status;
  final String message;
  final DashboardSummaryEntity oData;

  const DashboardSummaryResponse({
    required this.status,
    required this.message,
    required this.oData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'oData': oData,
    };
  }

  factory DashboardSummaryResponse.fromMap(Map<String, dynamic> map) {
    return DashboardSummaryResponse(
      status: map['status'] as bool,
      message: map['message'] as String,
      oData:
          DashboardSummaryModel.fromJson(map['oData'] as Map<String, dynamic>)
              .toEntity(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardSummaryResponse.fromJson(String source) =>
      DashboardSummaryResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
