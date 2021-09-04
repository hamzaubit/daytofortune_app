import 'package:daytofortune_app/widgets/colorClass.dart';
import 'package:daytofortune_app/widgets/sizeconfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class themesScreen extends StatefulWidget {
  @override
  _themesScreenState createState() => _themesScreenState();
}

class _themesScreenState extends State<themesScreen> {

  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg',
    'https://images.pexels.com/photos/799443/pexels-photo-799443.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://i.pinimg.com/736x/8e/6c/06/8e6c064f57f94838263d7ba9ad80f353.jpg',
    'https://i.pinimg.com/236x/6f/94/33/6f94339492f69da0ae206972d778a7ae.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThNPkct1L0SyOpfyPUOQezW8VN5p3FnzPhfkkmmau4uzjCx2J1HemBD6vZOoDGxjr_vqg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJblNzDSaHxwDAiiP9mdRbEv9Lsasm6AdQGEMV35iAoayTDrMpTmDKTN8ihttbHIZhfgI&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgVHsByYfsv1mxvyHySDL0GO_b4SSNK6ZHvCtZVTo1uV1XZq2BrcYusPcZaGvc6waNoow&usqp=CAU',
    'https://archziner.com/wp-content/uploads/2020/07/air-jordan-hoodie-worn-by-man-wearing-purge-mask-with-neon-lights-super-cool-wallpapers-holding-pink-smoke-bomb.jpg',
    "https://img.freepik.com/free-vector/colorful-palm-silhouettes-background_23-2148541792.jpg?size=626&ext=jpg"
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: primaryThemeColor,
        appBar: AppBar(
        backgroundColor: drawerColor,
        title: Text("Customize",style: GoogleFonts.poppins(color: secondaryThemeColor,fontSize: SizeConfig.blockSizeHorizontal! * 6.5),),
        ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: new StaggeredGridView.countBuilder(itemCount: imageList.length,mainAxisSpacing: 12,crossAxisSpacing: 12,crossAxisCount: 2,itemBuilder: (context , index){
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: imageList[index],fit: BoxFit.fill,),
            ),
          );
        }, staggeredTileBuilder: (index) {
           return new StaggeredTile.count(1,index.isEven ? 1.2 : 1.8);
        }),
      )
    );
  }
}

/*Stack(
children: [
Container(
height: SizeConfig.blockSizeVertical! * 13,
width: SizeConfig.blockSizeHorizontal! * 28,
child: Center(
child: CircularProgressIndicator(color: secondaryThemeColor,),
),
),
Container(
height: SizeConfig.blockSizeVertical! * 13,
width: SizeConfig.blockSizeHorizontal! * 28,
decoration: BoxDecoration(
border: Border.all(color: drawerColor,width: 1),
image: DecorationImage(
image: NetworkImage('https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/hand%20pointing%20to%20five%20gold%20stars-8213-48ea2ea0fbfdd487b0c019933dfb1604@1x.jpg'),fit: BoxFit.fill
)
),
),
],
);*/
