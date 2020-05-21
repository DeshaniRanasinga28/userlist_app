import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userlistapp/app/bloc/users_bloc.dart';
import 'package:userlistapp/app/models/users_response.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen>{

  double deviceWidth, deviceHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return WillPopScope(
      child: Scaffold(
        appBar: new AppBar(
          title: Text('User List',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OpenSans-Bold",
            ),
          ),
          backgroundColor: Color(0xFFAC0808),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.camera, color: Colors.white,),
            ),
          ],
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,

          child: StreamBuilder(
              stream: bloc.allUsers,
              builder: (context, AsyncSnapshot<UserseResponse> snapshot){
                if(snapshot.hasData){
                  return buildList(snapshot);
                }else if (snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                );
                return Center(child: CircularProgressIndicator());
              }
          ),
        ),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<UserseResponse> snapshot){
    return ListView.builder(
        itemCount: snapshot.data.users.length,
        itemBuilder: (BuildContext, int index){
          return getStructuredGridCell(snapshot.data.users[index]);
        });
  }

  Card getStructuredGridCell(Users users) {
    return Card(
      elevation: 10.0,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20.0, left: 10.0),
                    alignment: Alignment.topLeft,
                    child: Text(users.name,
                      style: TextStyle(
                          fontFamily: "OpenSans",
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, right: 10.0),
                      alignment: Alignment.topRight,
                      child: Text(users.address.toString(),
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 2.0, left: 10.0),
                    alignment: Alignment.topLeft,
                    child: Text("",
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 2.0, right: 10.0),
                      alignment: Alignment.topRight,
                      child:Text(users.address.street,
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Colors.black
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 2.0, left: 10.0),
                    alignment: Alignment.topLeft,
                    child: Text(users.email,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 2.0, right: 10.0),
                      alignment: Alignment.topRight,
                      child:Text(users.address.suite,
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Colors.black
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 2.0, left: 10.0, bottom: 20.0),
                    alignment: Alignment.topLeft,
                    child: Text(users.phone,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 2.0, right: 10.0, bottom: 20.0),
                      alignment: Alignment.topRight,
                      child:Text(users.address.city,
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            color: Colors.black
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
