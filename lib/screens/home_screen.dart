// home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final int currentYear = DateTime.now().year;

  late int viewYear;

  Color selectedColour = const Color(0xFFC4B5FD);

  bool pickerOpen = false;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    viewYear = currentYear;
  }

  void changeYear(int direction) {
    setState(() {
      final newYear = viewYear + direction;

      if (newYear >= 2000 && newYear <= currentYear) {
        viewYear = newYear;
      }
    });
  }

  void togglePicker() {
    setState(() {
      pickerOpen = !pickerOpen;
    });
  }

  void selectColour(Color colour) {
    setState(() {
      selectedColour = colour;
      isSaved = false;
    });
  }

  void saveToday() {
    setState(() {
      isSaved = true;
      pickerOpen = false;
    });
  }

  String get todayDate {
    final now = DateTime.now();

    return '${_weekday(now.weekday)} ${now.day} '
            '${_month(now.month)}'
        .toLowerCase();
  }

  String _weekday(int weekday) {
    const weekdays = [
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday',
    ];

    return weekdays[weekday - 1];
  }

  String _month(int month) {
    const months = [
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december',
    ];

    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'colour diary',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C2C2A),
                    ),
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: viewYear > 2000
                            ? () => changeYear(-1)
                            : null,
                        icon: const Icon(Icons.chevron_left),
                      ),

                      Text(
                        '$viewYear',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFA0998E),
                        ),
                      ),

                      IconButton(
                        onPressed: viewYear < currentYear
                            ? () => changeYear(1)
                            : null,
                        icon: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // todays colour card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFEDE8E0)),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: togglePicker,
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: selectedColour,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black.withValues(alpha: 0.06),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todayDate,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFFA0998E),
                            ),
                          ),

                          const SizedBox(height: 3),

                          Text(
                            isSaved
                                ? "today's colour is saved"
                                : "tap the circle to pick today's colour",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2C2C2A),
                            ),
                          ),
                        ],
                      ),
                    ),

                    OutlinedButton(
                      onPressed: saveToday,
                      child: Text(isSaved ? 'saved' : 'save'),
                    ),
                  ],
                ),
              ),

              // colour picker placeholder
              if (pickerOpen) ...[
                const SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFEDE8E0)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      ...[
                        const Color(0xFFFCA5A5),
                        const Color(0xFFFDBA74),
                        const Color(0xFFFCD34D),
                        const Color(0xFF86EFAC),
                        const Color(0xFF6EE7B7),
                        const Color(0xFF67E8F9),
                        const Color(0xFF93C5FD),
                        const Color(0xFFC4B5FD),
                        const Color(0xFFF0ABFC),
                        const Color(0xFFF9A8D4),
                        const Color(0xFFD1D5DB),
                        const Color(0xFFF5F0EA),
                        const Color(0xFFF87171),
                        const Color(0xFFFB923C),
                        const Color(0xFFFBBF24),
                        const Color(0xFF4ADE80),
                        const Color(0xFF34D399),
                        const Color(0xFF22D3EE),
                        const Color(0xFF60A5FA),
                        const Color(0xFFA78BFA),
                        const Color(0xFFE879F9),
                        const Color(0xFFF472B6),
                        const Color(0xFF9CA3AF),
                        const Color(0xFFE8E0F0),
                      ].map(
                        (colour) => GestureDetector(
                          onTap: () => selectColour(colour),
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: colour,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black.withValues(alpha: 0.06),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 20),

              // year calendar
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'this year',
                      style: TextStyle(
                        fontSize: 10,
                        letterSpacing: 0.5,
                        color: Color(0xFFB0A89E),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Expanded(
                      child: Center(
                        child: Text(
                          '$viewYear calendar will appear here',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFA0998E),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
