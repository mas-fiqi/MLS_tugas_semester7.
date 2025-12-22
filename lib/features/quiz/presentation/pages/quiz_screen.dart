import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Quiz Review 1"),
        centerTitle: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.timer, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text("15 : 00", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _questions[_currentQuestionIndex % _questions.length]['question'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          color: isSelected ? const Color(0xFFFFEBEE) : Colors.white, // Pinkish if selected
                          border: Border.all(
                            color: isSelected ? kPrimaryColor : Colors.grey[300]!,
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: isSelected ? kPrimaryColor : Colors.grey[200],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  optionLabel,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(child: Text(options[index])),
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
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    setState(() {
                      // Logic for next question
                      if (_currentQuestionIndex < 14) { // Dummy logic up to 15
                        _currentQuestionIndex++;
                        _selectedAnswerIndex = null; // Reset selection
                      }
                    });
                  },
                  child: Row(
                    children: const [
                      Text("Soal Selanjutnya"),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
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
      color: Colors.white,
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
              color: isCurrent ? kAccentColor : Colors.transparent, // Highlight active
              shape: BoxShape.circle,
              border: Border.all(color: isCurrent ? kAccentColor : Colors.grey),
            ),
            child: Center(
              child: Text(
                "${index + 1}",
                style: TextStyle(
                  color: isCurrent ? Colors.white : Colors.grey,
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
