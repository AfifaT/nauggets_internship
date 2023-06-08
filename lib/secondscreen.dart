import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green,
                    width: 3.0,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/img.png'),radius: 35.0,
                ),
              ),
              title: Text('John Doe',style: TextStyle(fontSize: 20),),
              //subtitle: Text('New York, USA'),
              subtitle: Row(
                children: [
                  Text('New York, USA'),
                  SizedBox(width: 5),
                  Icon(Icons.location_on, color: Colors.green,),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Container(
              width: 220.0,
              height: 220.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 4.0,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10.0,
                    right: 10.0,
                    child: ClipOval(
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        color: Colors.blue,
                        child: Icon(
                          Icons.bar_chart_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 4.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Balance',
                            style: TextStyle(
                              fontSize: 17.0,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '\$567,57',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 10.0,color: Colors.green,),
                        SizedBox(width: 8.0),
                        Text(
                          'INCOMES',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Text(
                      '309',
                      style: TextStyle(fontSize: 56.0),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 10.0,color: Colors.green,),
                        SizedBox(width: 8.0),
                        Text(
                          'EXPENSES',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Text(
                      '234',
                      style: TextStyle(fontSize: 56.0),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined,color: Colors.grey,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined,color: Colors.grey),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_rounded,color: Colors.grey),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.blue),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Colors.grey),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
