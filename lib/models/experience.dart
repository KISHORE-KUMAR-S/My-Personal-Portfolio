class Experience {
  Experience({
    required this.startDate,
    required this.endDate,
    required this.company,
    required this.position,
    required this.responsibilities,
  });

  final DateTime startDate, endDate;
  final String company, position;
  final List<String> responsibilities;

  static final List<Experience> kExperiences = [
    Experience(
      company: "Rurutek Private Limited",
      position: "Junior Engineer - Software (Mobile)",
      startDate: DateTime(2024, 2),
      endDate: DateTime.now(),
      responsibilities: [
        "Designed and implemented user-focused app-features, ensuring smooth navigation and enhanced functionality.",
        "Integrated REST APIs, Firebase, and third-party packages for back-end services and for fetching real-time data.",
        "Managed state effectively using GetX, Riverpod and Provider for scalable app architecture.",
        "End-to-end testing and debugging performed to deliver reliable, high-quality applications.",
      ],
    ),
    Experience(
      company: "Rurutek Private Limited",
      position: "Junior Engineer (Intern)",
      startDate: DateTime(2023, 8),
      endDate: DateTime(2024, 1),
      responsibilities: [
        "Built foundational Flutter applications focusing on UI/UX designs and app functionality.",
        "Gained hands-on experience in state management, API integration and Flutter packages."
      ],
    )
  ];
}
