import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/material.dart';

class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryThemeColor,
      appBar: AppBar(backgroundColor: primaryThemeColor,
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: textColor,width: 0.5),
            color: drawerColor,
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    color: drawerColor
                ),
                child: Center(
                  child: Text(
                    "Menu",
                    style: TextStyle(color: textColor,fontSize: 25),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                ),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text('Categories',
                    style: TextStyle(color: textColor,fontSize: 14),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                ),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text('My Quotes',
                    style: TextStyle(color: textColor,fontSize: 14),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                ),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text('Fortune Academy',
                    style: TextStyle(color: textColor,fontSize: 14),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                ),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text('Notifications',
                    style: TextStyle(color: textColor,fontSize: 14),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                ),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text('Get Membership',
                    style: TextStyle(color: textColor,fontSize: 14),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                ),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text('Sign In',
                    style: TextStyle(color: textColor,fontSize: 14),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: textColor,width: 0.5)
                ),
                child: ListTile(
                  tileColor: drawerColor,
                  title: const Text('Settings',
                    style: TextStyle(color: textColor,fontSize: 14),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 18,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Follow Us!",
                  style: TextStyle(color: textColor,fontSize: 15),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3.5,
                    width: SizeConfig.blockSizeHorizontal! * 7.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/fb.png'),fit: BoxFit.fill
                        )
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3,
                    width: SizeConfig.blockSizeHorizontal! * 6.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/insta.png'),fit: BoxFit.fill
                        )
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3,
                    width: SizeConfig.blockSizeHorizontal! * 6.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/tiktok.png'),fit: BoxFit.fill
                        )
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                  Container(
                    height: SizeConfig.blockSizeVertical! * 3,
                    width: SizeConfig.blockSizeHorizontal! * 6.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/twitter.png'),fit: BoxFit.fill
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
