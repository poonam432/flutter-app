import 'package:application/images_file.dart';
import 'package:flutter/material.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  List<String> imgList=['assets/images/available_rooms.jpg',
  'assets/images/loginWannImage.png',
  'assets/images/splash.png','assets/images/splash.png','assets/images/splash.png'];
List<String> amountList = ['30, 130, 560'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            image1,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height/4,
          // Adjust the bottom value for desired spacing
          child: Container(
            padding: EdgeInsets.only(left: 20.0,right: 20.0, top: 20.0),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                  Text('New Arrival'),
                  Text('View All', style: TextStyle(color: Colors.redAccent),)
                ],),
                const SizedBox(height: 20.0,),
                SizedBox(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    children: List.generate(imgList.length, (index) {
                      return
                        Image.asset(
                          imgList[index],
                        fit: BoxFit.cover,
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),    // GridView


      ],
    );
  }
  }

