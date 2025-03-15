import 'package:flutter/material.dart';

class ProjectItemData {
  ProjectItemData({
    this.appLogoColor = Colors.black,
    required this.category,
    required this.coverImage,
    this.designer,
    this.githubUrl = "",
    this.hasBeenReleased = false,
    required this.image,
    this.imageSize,
    this.isLive = false,
    this.isOnPlayStore = false,
    this.isPublic = false,
    this.navSelectedTitleColor = Colors.black,
    this.navTitleColor = Colors.grey,
    this.playStoreUrl = "",
    required this.platform,
    required this.portfolioDescription,
    required this.primaryColor,
    this.projectAssets = const [],
    required this.subtitle,
    this.technologyUsed,
    required this.title,
    this.webUrl = "",
  });

  final Color appLogoColor;
  final String category;
  final String coverImage;
  final String? designer;
  final String githubUrl;
  final bool hasBeenReleased;
  final String image;
  final double? imageSize;
  final bool isLive;
  final bool isOnPlayStore;
  final bool isPublic;
  final Color navSelectedTitleColor;
  final Color navTitleColor;
  final String playStoreUrl;
  final String platform;
  final String portfolioDescription;
  final Color primaryColor;
  final List<String> projectAssets;
  final String subtitle;
  final String? technologyUsed;
  final String title;
  final String webUrl;
}
