import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sab7a/card_white.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}
class _home_pageState extends State<home_page> {
  restzero({bool rest=false}){
    setCount(0);
    setTimes(0);
    rest?setcolor(0xffb1001c):null;
    rest?setgoal(value: 1):null;
  }
  setCount (int value) async {
    SharedPreferences prfes=await SharedPreferences.getInstance();
    prfes.setInt("count", value);
    getData();
  }
  setgoal ({required int value,bool rest=false}) async {
    SharedPreferences prfes=await SharedPreferences.getInstance();
    prfes.setInt("goal", value);
    restzero(rest: rest);
    getData();
  }
  setTimes (int value) async {
    SharedPreferences prfes=await SharedPreferences.getInstance();
    prfes.setInt("times", value);
    getData();
  }
  setcolor (int value) async {
    SharedPreferences prfes=await SharedPreferences.getInstance();
    prfes.setInt("color", value);
    getData();
  }
  getData () async {
    SharedPreferences prfes=await SharedPreferences.getInstance();
    setState(() {
      hexcolor=prfes.getInt("color")??0xffb1001c;
      times=prfes.getInt("times")??0;
      count=prfes.getInt("count")??0;
      goal=prfes.getInt("goal")??1;

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  int hexcolor=0xffb1001c;
  int times=0;
  int count=0;
  int goal=1;
  Color white_color=Colors.white;
  bool active=false;
  @override
  Widget build(BuildContext context) {
    Color maincolor=Color(hexcolor);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){
        restzero(rest: true);
      },
        backgroundColor: maincolor,
      child: Icon(Icons.refresh,color: white_color,size: 30,),),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){
          setState(() {
            active=!active;
          });
        }, icon: active?Icon(Icons.color_lens,color: white_color,):Icon(Icons.color_lens_outlined,color: white_color,)),
        backgroundColor: maincolor,
      ),
      body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: maincolor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("الهدف",style: TextStyle(
                          color: white_color,
                          fontSize: 35
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed:(){
                              setgoal(value: goal+1);
                            }, icon:Icon(Icons.add_circle,color: white_color,size: 25,)),
                            Text("$goal",style: TextStyle(
                                color: white_color,
                                fontSize: 35
                            )),
                            IconButton(onPressed:(){
                              if(goal!=0)
                              setgoal(value: goal-1);
                            }, icon:Icon(Icons.remove_circle,color:white_color,size: 25,)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap:(){
                                setgoal(value: 1100);
                              },
                              child: card(value: "+1000"),
                            ),
                            GestureDetector(
                              onTap:(){
                                setgoal(value: 110);
                              },
                              child: card(value: "+100"),
                            ),
                            GestureDetector(
                              onTap:(){
                                setgoal(value: 100);
                              },
                              child: card(value: "100"),
                            ),
                            GestureDetector(
                              onTap:(){
                                setgoal(value: 33);
                              },
                              child: card(value: "33"),
                            ),
                            GestureDetector(
                              onTap:(){
                                setgoal(value: 1);
                              },
                              child: card(value: "1"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("الاستغفار",style: TextStyle(
                            color: maincolor,
                            fontSize: 25
                          ),),
                          SizedBox(height: 10,),
                          Text("$count",style: TextStyle(
                              color: maincolor,
                              fontSize: 25
                          ),),
                          SizedBox(height: 10,),
                          new CircularPercentIndicator(
                            radius: 90.0,
                            lineWidth: 5.0,
                            percent: count/goal,
                            center: new IconButton(onPressed: (){
                              if(count==goal){
                                setTimes(times+1);
                                setCount(1);
                              }else{
                                setCount(count+1);
                              }
                            }, icon: Icon(
                              Icons.touch_app,
                              size: 50.0,
                              color: maincolor,
                            )),
                            backgroundColor: maincolor.withOpacity(0.4),
                            progressColor: maincolor,
                          ),
                          SizedBox(height: 10,),
                          Text("عدد مرات التكرار : $times ",style: TextStyle(
                              color: maincolor,
                              fontSize: 20,
                          ),textDirection:TextDirection.rtl ,),
                          SizedBox(height: 10,),
                          Text("المجموع : ${times*goal+count}",style: TextStyle(
                              color: maincolor,
                              fontSize: 20
                          ),textDirection:TextDirection.rtl),
                          Spacer(),
                          Visibility(
                            visible: !active,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Radio(
                                    fillColor: MaterialStateProperty.all<Color>(Color(0xffb1001c)),
                                    value: 0xffb1001c, groupValue: hexcolor, onChanged:(val){
                                  setState(() {
                                    hexcolor=val!;
                                    setcolor(hexcolor);
                                  });
                                }),
                                Radio(
                                    fillColor: MaterialStateProperty.all<Color>(Color(0xff010117)),
                                    value: 0xff010117, groupValue: hexcolor, onChanged:(val){
                                  setState(() {
                                    hexcolor=val!;
                                    setcolor(hexcolor);
                                  });
                                }),
                                Radio(
                                    fillColor: MaterialStateProperty.all<Color>(Color(0xff024a0c)),
                                    value: 0xff024a0c, groupValue: hexcolor, onChanged:(val){
                                  setState(() {
                                    hexcolor=val!;
                                    setcolor(hexcolor);
                                  });
                                }),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ],
      ),
    );
  }
}
