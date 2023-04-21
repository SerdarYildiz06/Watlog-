import 'package:flutter/material.dart';
import 'package:watlog/utils/colors.dart';

class HelpCenterView extends StatefulWidget {
  const HelpCenterView({super.key});

  @override
  State<HelpCenterView> createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with us'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 0, right: 0),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Support',
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 0, right: 0),
                              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                color: ColorConstants.instance.chatBubleBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Hello there, how can we help you? Hello the jsadklasjasdlka',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 48.0, right: 8.0),
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: ColorConstants.instance.chatBubleBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end, // align to bottom of container
                      children: [
                        Text(
                          'Hello thsere, how can we help you? Hello ',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 4.0), // add some spacing between text and icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '09.15 PM',
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            SizedBox(width: 4.0), // add some spacing between time and icon
                            Icon(
                              Icons.check,
                              color: Colors.grey,
                              size: 16.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          prefixIcon: Transform.rotate(
                            angle: 3.14 / 4,
                            child: Icon(
                              Icons.attach_file_sharp,
                              color: ColorConstants.instance.blue,
                            ),
                          ),
                          hintText: 'Type your message',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    onPressed: () {
                      String message = _messageController.text;
                      if (message.isNotEmpty) {
                        _messageController.clear();
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: ColorConstants.instance.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
