import 'package:flutter/material.dart';

/// Display-only model for a row in the tracking history list. Mocked for now
/// — swap the hardcoded list in [HomePage] for a real repository once a
/// tracking backend exists.
class TrackingItem {
  const TrackingItem({
    required this.title,
    required this.code,
    required this.icon,
    required this.statusLabel,
    required this.statusColor,
    this.statusSubLabel,
    this.statusTextColor = Colors.black,
  });

  final String title;
  final String code;
  final Widget icon;
  final String statusLabel;
  final String? statusSubLabel;
  final Color statusColor;
  final Color statusTextColor;
}
