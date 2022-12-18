import 'package:flutter/material.dart';
import 'package:uitasarimapp/detailspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Hot',
    ),
    Tab(text: 'Sort'),
    Tab(text: 'Show'),
  ];

  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_play_outlined),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.punch_clock_outlined),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album_rounded),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(2),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        hintText: "search",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.content_paste_go_outlined,
                      size: 28,
                    ))
              ],
            ),
          ),

          Material(
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    automaticIndicatorColorAdjustment: true,
                    labelPadding: EdgeInsets.all(0),
                    indicatorColor: Colors.transparent,
                    tabs: myTabs,
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: "assets/images/girl3.jpeg",
                  child: Material(
                    child: InkWell(
                      child: _buildContainer(context, "assets/images/girl3.jpeg",
                          width: (deviceSize.width - 40) / 2,
                          height: deviceSize.height / 2 - 120),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DetailPage(image: "assets/images/girl3.jpeg")));
                      },
                    ),
                  ),
                ),
                Hero(
                  tag: "assets/images/girl5.jpeg",
                  child: Material(
                    child: InkWell(
                      child: _buildContainer(context, "assets/images/girl5.jpeg",
                          width: (deviceSize.width - 40) / 2,
                          height: deviceSize.height / 2 - 120),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DetailPage(image: "assets/images/girl5.jpeg")));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/listviewpic${index + 1}.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15, left: 15, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildMiddleContainder(
                    width: (deviceSize.width - 40) / 2, text: "Fashion bazaar"),
                _buildMiddleContainder(
                    width: (deviceSize.width - 40) / 2, text: "Louis vuitton"),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: "assets/images/girl1.jpeg",
                  child: Material(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DetailPage(image: "assets/images/girl1.jpeg")));
                      },
                      child: _buildContainer(context, "assets/images/girl1.jpeg",
                          width: (deviceSize.width - 40) / 2,
                          height: deviceSize.height / 2 - 120),
                    ),
                  ),
                ),
                Hero(
                  tag: "assets/images/girl4.jpeg",
                  child: Material(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DetailPage(image: "assets/images/girl4.jpeg")));
                      },
                      child: _buildContainer(context, "assets/images/girl4.jpeg",
                          width: (deviceSize.width - 40) / 2,
                          height: deviceSize.height / 2 - 120),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container _buildMiddleContainder(
    {required double width, required String text}) {
  return Container(
    alignment: Alignment.centerLeft,
    width: width,
    height: 40,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    ),
  );
}

Container _buildContainer(BuildContext context, String imagePath,
    {required double width, required double height}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
  );
}
