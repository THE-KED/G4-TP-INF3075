import 'package:flutter/material.dart';
import 'package:inf3075_mobile_money/utils/themes.dart';

class ReportBug extends StatefulWidget {
  const ReportBug({Key? key}) : super(key: key);

  @override
  State<ReportBug> createState() => _ReportBugState();
}

class _ReportBugState extends State<ReportBug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(218, 255, 168, 3),
        elevation: 2.0,
        centerTitle: true,
        title: const Text(
          " Let's Help you ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [],
            ),
            SizedBox(height: 10.0),
            Text(
              "Report a Bug",
              style: TextStyle(color: Color(0xffc5c5c5)),
            ),
            SizedBox(height: 25.0),

            SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  buildCheckItem("Login trouble "),
                  buildCheckItem("Phone Number Related "),
                  buildCheckItem("Personal Profile "),
                  buildCheckItem("Other issues "),
                  buildCheckItem("Suggestions "),
                  SizedBox(height: 20.0),
                  buildFeedBackForm(),
                  SizedBox(height: 20),
                  buildNumberField(),
                  SizedBox(height: 20),
                  buildCallAssistance(),
                ],
              ),
            )),

            Spacer(),

            //Submit Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR, //Color.fromARGB(255, 34, 48, 231),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.green,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: ((context) => Container(
                              height: 100,
                              child: const Center(
                                child: Text(
                                  'Thank you, Your report has been received',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            )));
                  },
                  child: const Center(
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildNumberField() {
    //If the user have to enter the number to call
    return TextField(
      keyboardType: TextInputType.phone,
      maxLength: 9,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Color(0xffc5c5c5))),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(width: 10),
                  Text(
                    "+237",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffc5c5c5),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.cyan,
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xffc5c5c5),
        ),
        hintText: "Phone Number",
        border: const OutlineInputBorder(),
      ),
    );

    // If the user does not have to enter the number to call
    /* return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.call,
        size: 24.0,
      ),
      label: Text('Call for assistance'),
    );*/
  }

  //Call for assistance

  buildCallAssistance() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.call,
        size: 24.0,
      ),
      label: const Text('Call for assistance'),
    );
  }

  buildFeedBackForm() {
    return Container(
      height: 200,
      child: Stack(
        children: <Widget>[
          const TextField(
            keyboardType: TextInputType.name,
            maxLines: 10,
            maxLength: 255,
            decoration: InputDecoration(
              hintText: " Please Breifly Describe Your Problem ",
              hintStyle: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffe5e5e5)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Color(0xffa6a6a6),
                  ),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Visibility(
                visible: false,
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffe5e5e5),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.add,
                          color: Color(0xffa5a5a5),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Upload a Picture (optional)",
                      style: TextStyle(
                        color: Color(0xffc5c5c5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildCheckItem(title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: <Widget>[
          const Icon(Icons.check_circle, color: Colors.blue),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
