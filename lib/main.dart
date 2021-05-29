import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        body: ReviewPage(),
      ),
    );
  }
}

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  var count = 57;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: null);
          },
        ),
        centerTitle: true,
        title: Text(
          'Reviews',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.black,
              ),
              onPressed: null)
        ],
        toolbarHeight: 60,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ratingstar(count),
          horizontalbars('Excellent', 0.9, Colors.green),
          horizontalbars('Good', 0.75, Colors.lightGreen),
          horizontalbars('Average', 0.5, Colors.yellow),
          horizontalbars('Below Average', 0.35, Colors.orangeAccent),
          horizontalbars('Poor', 0.2, Colors.red),
          Divider(
            indent: 40,
            endIndent: 40,
            thickness: 1.5,
          ),
          reviewslist()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        icon: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        label: Text('Add a Review'),
        onPressed: () {
          //TODO
          _ModalBottomSheet(context);
        },
      ),
    );
  }
}

reviewslist() {
  return Expanded(
    child: Container(
        child: ListView(
      children: [
        feedback(),
        feedback(),
        feedback(),
        feedback(),
        feedback(),
        feedback(),
        feedback()
      ],
    )),
  );
}

feedback() {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/image/cus2.jpg'),
                            fit: BoxFit.cover)),
                    padding: EdgeInsets.all(30),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ' John Person',
                          style: TextStyle(
                              fontSize: 12,
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        stars(),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '1 days ago',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontStyle: FontStyle.italic),
                  ))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text(
            'This chair is a great addition for any room in your home,not only just the living room. Featuring a mid-centuary design with modern available in the market. however and with that said, if you are like most people in the...',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    ),
  );
}

Container ratingstar(var count) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            child: Text(
          '4.5',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        )),
        Padding(
          child: stars(),
          padding: EdgeInsets.only(top: 10, bottom: 10),
        ),
        Text(
          'based on $count reviews',
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
        ),
      ],
    ),
  );
}

stars() {
  return Container(
    padding: EdgeInsets.only(top: 0, bottom: 0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.star_rounded,
          color: Colors.orangeAccent,
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.orangeAccent,
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.orangeAccent,
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.orangeAccent,
        ),
        Icon(
          Icons.star_half_rounded,
          color: Colors.orangeAccent,
        ),
      ],
    ),
  );
}

Container horizontalbars(String text, double val, Color cx) {
  return Container(
      child: Column(
    children: [
      Container(
        padding: EdgeInsets.only(left: 15, bottom: 5, right: 15),
        child: Row(
          children: [
            Container(
                width: 100,
                child: Text(
                  text,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: LinearProgressIndicator(
                  semanticsLabel: 'Excellent',
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(cx),
                  value: val,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ));
}

void _ModalBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * .70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0)),
                color: Colors.white),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Divider(
                  indent: 130,
                  endIndent: 130,
                  thickness: 7,
                  color: Colors.black54,
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Please Rate Your Experience',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
              clickablestars(),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  'Please Share Your Opinion',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    backgroundColor: Colors.white12,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: 'Your review',
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.only(top: 70),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20))),
                    child: Text(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                      
                    )),
              ),
            ]),
          ),
        );
      });
}

clickablestars() {
  bool toggle = true;
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
          icon: Icon(
            Icons.star_border,
            color: Colors.orangeAccent,
            size: 40,
          ),
          onPressed: () {}),
      IconButton(
          icon: Icon(
            Icons.star_border,
            color: Colors.orangeAccent,
            size: 40,
          ),
          onPressed: () {}),
      IconButton(
          icon: Icon(
            Icons.star_border,
            color: Colors.orangeAccent,
            size: 40,
          ),
          onPressed: () {}),
      IconButton(
          icon: Icon(
            Icons.star_border,
            color: Colors.orangeAccent,
            size: 40,
          ),
          onPressed: () {}),
      IconButton(
          icon: Icon(
            toggle ? Icons.star_border : Icons.star,
            color: Colors.orangeAccent,
            size: 40,
          ),
          onPressed: () {
            //print('Hello');
          }),
    ],
  );
}
