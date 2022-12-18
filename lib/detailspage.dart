import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String image;

  DetailPage({required this.image, Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.cover),
              color: Colors.red),
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          left: 20,
          top: 35,
          child: Hero(
            tag: widget.image,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.4,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/listviewpic${index + 1}.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
        Positioned(
          left: 23,
          bottom: MediaQuery.of(context).size.height/2.7,
          child: Container(
            width: MediaQuery.of(context).size.width/4,
            height: (MediaQuery.of(context).size.height-100)/2,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 15,),
                Icon(Icons.favorite,color: Colors.red,size: 30,),
              Text("1.8k",style: TextStyle(color: Colors.grey),),
              SizedBox(height: 15,),
              Icon(Icons.star,size: 30,),
              Text("1.2k",style: TextStyle(color: Colors.grey),),
                SizedBox(height: 15,),
                Icon(Icons.arrow_circle_right,size: 30,),
              Text("buy all",style: TextStyle(color: Colors.grey),),
                SizedBox(height: 15,),
                Icon(Icons.punch_clock,size: 30,),
                SizedBox(height: 15,),
              ],),
          ),
        )
      ]),
    );
  }
}
