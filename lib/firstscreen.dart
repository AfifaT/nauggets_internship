import 'package:flutter/material.dart';
import 'package:nauggets_internship/secondscreen.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

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
              // Handle menu button press
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
              title: Text('Tommy Berns',style: TextStyle(fontSize: 20),),
              //subtitle: Text('New York, USA'),
              subtitle: Row(
                children: [
                  Text('Los Angeles'),
                  SizedBox(width: 5),
                  Icon(Icons.location_on, color: Colors.green,),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Balance",style: TextStyle(fontSize: 20,color: Colors.black,),),
                SizedBox(width: 15,),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SecondPage()),
                      );
                    },
                    child: Text("\$567,57",style: TextStyle(fontSize: 30,color: Colors.black, fontWeight: FontWeight.bold),)),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add, color: Colors.blue),
                      radius: 30.0,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.search, color: Colors.blue),
                      radius: 30.0,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.bar_chart, color: Colors.blue),
                      radius: 30.0,
                      foregroundColor: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: 300.0,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              child: Image.asset(
                'assets/images/img_1.png',
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20.0),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    onTap: () {

                    },
                    title: Text('My Cards'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    onTap: () {

                    },
                    title: Text('Transactions'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
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
