import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app_cu/view/app_base.dart';
import 'package:final_app_cu/widgets/cu_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _feedback = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CuAppBar(
          isHome: false,
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('companies')
                .doc(USERID)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffD12123),
                  ),
                );
              }
              dynamic data = snapshot.data!.data();
              _name = data['name'];
              _email = data['gmail'];
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      const Text(
                        'We would like to have a detailed Feedback from your side',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () async {
                            String? url;
                            var collection =
                                FirebaseFirestore.instance.collection('forms');
                            var querySnapshot = await collection.get();
                            for (var queryDocumentSnapshot
                                in querySnapshot.docs) {
                              Map<String, dynamic> data =
                                  queryDocumentSnapshot.data();
                              url = data['url'];
                            }
                            print(url);
                            launchUrlString(url!);
                          },
                          child: Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  const Color(0xffD12123).withOpacity(0.57),
                                  const Color(0xffD12123)
                                ])),
                            child: const Center(
                                child: Text(
                              'Answer here',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                          child: const Text(
                        "OR",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      )),
                      const SizedBox(height: 5.0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your feedback';
                          }
                          return null;
                        },
                        onSaved: (value) => _feedback = value!,
                        maxLines: 5,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: 'Enter your feedback',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.red,
                              )
                            : InkWell(
                                onTap: _submitForm,
                                child: Container(
                                  height: 50,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        const Color(0xffD12123)
                                            .withOpacity(0.57),
                                        const Color(0xffD12123)
                                      ])),
                                  child: const Center(
                                      child: Text(
                                    'Save',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                                ),
                              ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // TODO: Send feedback data to server

      setState(() {
        _isLoading = true;
      });

      // Simulate a network delay of 2 seconds
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thank you for your feedback!'),
          backgroundColor: Colors.red,
        ),
      );

      Map<String, dynamic> res = {
        "name": _name,
        "email": _email,
        "feedback": _feedback,
      };

      FirebaseFirestore.instance.collection('feedback').add(res);

      // Clear form fields
      _formKey.currentState!.reset();
    }
  }
}
