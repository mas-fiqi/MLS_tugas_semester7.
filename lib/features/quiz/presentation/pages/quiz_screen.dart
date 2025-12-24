import 'package:flutter/material.dart';
import 'package:learning_management_system/features/quiz/presentation/pages/quiz_result_screen.dart';
import 'package:learning_management_system/core/constants/colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex; // Nullable to check if answer is selected
  
  // Dummy Questions
  final List<Map<String, dynamic>> _questions = [
    {
      "question": "Radio button dapat digunakan untuk menentukan?",
      "options": [
        "Satu pilihan dari beberapa opsi",
        "Banyak pilihan sekaligus",
        "Input teks bebas",
        "Mengirim formulir",
        "Menampilkan gambar"
      ]
    },
    {
       "question": "Apa fungsi dari Scaffold dalam Flutter?",
       "options": [
         "Menyusun layout dasar",
         "Membuat animasi",
         "Mengakses database",
         "Melakukan request HTTP",
         "Menghapus widget"
       ]
    },
    // Add more dummy questions if needed to match 15
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text("Quiz Review 1", style: TextStyle(color: kTextColor)),
        centerTitle: false,
        iconTheme: const IconThemeData(color: kTextColor),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(color: kOutlineColor.withOpacity(0.1), height: 1.0),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kPrimaryColor.withOpacity(0.3)),
            ),
            child: Row(
              children: const [
                Icon(Icons.timer, color: kPrimaryColor, size: 18),
                SizedBox(width: 8),
                Text("15 : 00", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // 1. Question Number Navigation
          _buildQuestionNavigation(),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Question Text
                  Text(
                    "Soal Nomor ${_currentQuestionIndex + 1} / 15",
                    style: const TextStyle(color: kSubtitleColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _questions[_currentQuestionIndex % _questions.length]['question'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor),
                  ),
                  const SizedBox(height: 24),
                  
                  // 3. Answer Options
                  ...List.generate(5, (index) {
                    final options = _questions[_currentQuestionIndex % _questions.length]['options'] as List;
                    final optionLabel = String.fromCharCode(65 + index); // A, B, C, D, E
                    final isSelected = _selectedAnswerIndex == index;
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedAnswerIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: kCardColor,
                          border: Border.all(
                            color: isSelected ? kPrimaryColor : kOutlineColor.withOpacity(0.1),
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(16), // Softer radius
                          boxShadow: isSelected ? [
                            BoxShadow(
                              color: kPrimaryColor.withOpacity(0.2),
                              blurRadius: 10,
                            ) 
                          ] : [],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: isSelected ? kPrimaryColor : kBackgroundColor,
                                shape: BoxShape.circle,
                                border: isSelected ? null : Border.all(color: kSubtitleColor.withOpacity(0.3)),
                              ),
                              child: Center(
                                child: Text(
                                  optionLabel,
                                  style: TextStyle(
                                    color: isSelected ? Colors.black : kSubtitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                options[index], 
                                style: TextStyle(
                                  color: isSelected ? kPrimaryColor : kTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          
          // 4. Bottom Navigation Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kCardColor,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, -5))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.black, // Dark text
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (_currentQuestionIndex < 14) {
                      setState(() {
                        _currentQuestionIndex++;
                        _selectedAnswerIndex = null;
                      });
                    } else {
                       Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const QuizResultScreen()),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Text(_currentQuestionIndex == 14 ? "Selesai" : "Soal Selanjutnya"),
                      const SizedBox(width: 8),
                      Icon(_currentQuestionIndex == 14 ? Icons.check : Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionNavigation() {
    return Container(
      height: 60,
      color: kCardColor,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isCurrent = index == _currentQuestionIndex;
          return Container(
            width: 40,
            decoration: BoxDecoration(
              color: isCurrent ? kPrimaryColor : kBackgroundColor, // Neon or Dark
              shape: BoxShape.circle,
              border: Border.all(color: isCurrent ? kPrimaryColor : kOutlineColor.withOpacity(0.3)),
              boxShadow: isCurrent ? [BoxShadow(color: kPrimaryColor.withOpacity(0.4), blurRadius: 8)] : [],
            ),
            child: Center(
              child: Text(
                "${index + 1}",
                style: TextStyle(
                  color: isCurrent ? Colors.black : kSubtitleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
