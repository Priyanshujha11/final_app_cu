import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({Key? key}) : super(key: key);

  @override
  _SocialMediaScreenState createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  bool _isExpandedGoogle = false;
  bool _isExpandedMicrosoft = false;
  bool _isExpandedTinder = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _isExpandedGoogle = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(
                      FontAwesomeIcons.squareFacebook,
                      color: Colors.blue.shade700,
                    ),
                    // title: Text('Facebook'),
                  );
                },
                body: ListTile(
                  title: Text('Facebook Details'),
                ),
                isExpanded: _isExpandedGoogle,
              ),
            ],
          ),
        ),
        Expanded(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _isExpandedMicrosoft = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(
                      FontAwesomeIcons.squareFacebook,
                      color: Colors.blue.shade700,
                    ),
                    // title: Text('Twitter'),
                  );
                },
                body: ListTile(
                  title: Text('Twitter Details'),
                ),
                isExpanded: _isExpandedMicrosoft,
              ),
            ],
          ),
        ),
        Expanded(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _isExpandedTinder = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(
                      FontAwesomeIcons.squareFacebook,
                      color: Colors.blue.shade700,
                    ),
                    // title: Text('Instagram'),
                  );
                },
                body: ListTile(
                  title: Text('Instagram Details'),
                ),
                isExpanded: _isExpandedTinder,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
