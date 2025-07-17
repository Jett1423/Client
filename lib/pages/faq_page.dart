import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  // Firestore reference to the 'faqs' collection
  final CollectionReference _faqsCollection =
      FirebaseFirestore.instance.collection('faqs');

  // Function to add a new FAQ
  Future<void> _addFaq() async {
    final String question = _questionController.text.trim();
    final String answer = _answerController.text.trim();

    if (question.isNotEmpty && answer.isNotEmpty) {
      await _faqsCollection.add({
        'question': question,
        'answer': answer,
      });

      // Clear the fields after saving
      _questionController.clear();
      _answerController.clear();
    }
  }

  // Function to delete a FAQ
  Future<void> _deleteFaq(String docId) async {
    await _faqsCollection.doc(docId).delete();
  }

  // Function to edit a FAQ
  Future<void> _editFaq(
      String docId, String initialQuestion, String initialAnswer) async {
    _questionController.text = initialQuestion;
    _answerController.text = initialAnswer;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit FAQ'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(labelText: 'Question'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _answerController,
              decoration: const InputDecoration(labelText: 'Answer'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final String updatedQuestion = _questionController.text.trim();
              final String updatedAnswer = _answerController.text.trim();

              if (updatedQuestion.isNotEmpty && updatedAnswer.isNotEmpty) {
                await _faqsCollection.doc(docId).update({
                  'question': updatedQuestion,
                  'answer': updatedAnswer,
                });

                Navigator.of(context).pop();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(
                labelText: 'Question',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _answerController,
              decoration: const InputDecoration(
                labelText: 'Answer',
              ),
              maxLines: null, // This allows the answer field to be multiline
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addFaq,
              child: const Text('Add FAQ'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _faqsCollection.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final faqs = snapshot.data!.docs;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListView.builder(
                      itemCount: faqs.length,
                      itemBuilder: (context, index) {
                        final faq = faqs[index];
                        final docId = faq.id; // Document ID for deletion
                        final question = faq['question'];
                        final answer = faq['answer'];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(question),
                              subtitle: Text(answer),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () {
                                      _editFaq(docId, question, answer);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      _deleteFaq(docId);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
