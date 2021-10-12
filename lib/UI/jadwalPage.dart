import 'package:flutter/material.dart';
import 'package:mobile_desa/Models/jadwal.dart';
import 'package:mobile_desa/Services/apiStatic.dart';
import 'package:mobile_desa/UI/detailJadwalPage.dart';
import 'package:mobile_desa/UI/homePage.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({ Key? key }) : super(key: key);

  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("Jadwal Kegiatan"),
      ),
      body: FutureBuilder <List<Jadwal>>(
          future:ApiStatic.getJadwal(),
          builder: (context, snapshot){
            if (snapshot.connectionState==ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              List<Jadwal> listJadwal=snapshot.data!;
                return Container(
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index)=>Column(
                      children: [
                        InkWell(
                          onTap:  (){
                            Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context)=>DetaiJadwalPage(jadwal: listJadwal[index],)
                          ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                              border: Border.all(width: 1,color: Colors.lightGreenAccent)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                               Image.asset(
                                 listJadwal[index].foto,
                                 width: 25,
                               ),
                              Column(
                                children:[
                                  Text(listJadwal[index].rencanakerja),
                                ],
                              )
                              ],
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                );
            }
        },
      ),
            bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        onTap: (i){
          switch (i) {
            case 0:
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext contect)=>HomePage()
                  ));
              break;
              case 1:
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext contect)=>JadwalPage()
                  ));
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), title: Text("Jadwal")),
        ],
      ),
    );
  }
}