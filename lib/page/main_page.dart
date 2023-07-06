import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../widgets/responsive.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.add_home_outlined),
      label:'Necklace',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today),
      label: 'Bracelet',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.tab_rounded),
      label: 'Ring',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Etc',
    ),

  ];
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      backgroundColor: const Color(0xffddd7c9),
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
        backgroundColor: const Color(0xffddd7c9),
        elevation: 0,
        centerTitle: true,
        title: Text("MarshAcc",style: GoogleFonts.ebGaramond(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
        bottom: PreferredSize(
          preferredSize:Size(screenSize.width, 50.h),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: const Color(0xffddd7c9),
            selectedItemColor: Colors.black,
            currentIndex: selectedIndexGlobal.value,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: GoogleFonts.montserrat(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w600,letterSpacing: 2),
            unselectedLabelStyle: GoogleFonts.montserrat(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.w600,letterSpacing: 2),
            selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
            unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
            items: bottomNavBarItems,
            onTap: (selected) {
              setState(() {
                selectedIndexGlobal.value = selected;
              });
            },
          ),
        ),
      )
          : PreferredSize(
        preferredSize: Size(screenSize.width, 100.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon:Icon(Icons.menu,size: 20.r,),),
                    Text("MarshAcc",style: GoogleFonts.ebGaramond(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){}, child:  Text("Necklace",style: GoogleFonts.montserrat(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.bold),)),
                    TextButton(onPressed: (){}, child:  Text("Bracelet",style: GoogleFonts.montserrat(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.bold),)),
                    TextButton(onPressed: (){}, child:  Text("Ring",style: GoogleFonts.montserrat(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.bold),)),
                    TextButton(onPressed: (){}, child:  Text("Etc",style: GoogleFonts.montserrat(fontSize: 14.sp,color: Colors.black,fontWeight: FontWeight.bold),)),

                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon:Icon(Icons.person,size:20.r,)),
                    IconButton(onPressed: (){}, icon:Icon(Icons.shopping_cart,size: 20.r,)),

                  ],
                )
              ],
            ),
            SizedBox(height: 5.h,),
            Divider(color: Color(0x99000000),thickness: 1.h,height: 0.h,)
          ],
        ),
      ),
      body: ResponsiveWidget.isSmallScreen(context)?SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h,),
                  Center(child: Image.asset('assets/necklace/pearl.png',width: 200.w,height: 200.r,fit: BoxFit.fill,)),
                  SizedBox(height: 10.h,),
                  Text("Pearl Necklace",style: GoogleFonts.ebGaramond(fontSize: 30.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10.h,),
                  Text("Rp. 10.000",style: GoogleFonts.ebGaramond(fontSize: 30.sp,color: Colors.black,fontWeight: FontWeight.bold),), ],
              ),
            ),
          ],
        ),
      ):SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("NECKLACE",style: GoogleFonts.montserrat(fontSize: 20.sp,color: Colors.black,fontWeight: FontWeight.w600,letterSpacing: 2),),
                SizedBox(height: 10.h,),
                Text("Pearl Necklace",style: GoogleFonts.ebGaramond(fontSize: 40.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.h,),
                Text("Rp. 10.000",style: GoogleFonts.ebGaramond(fontSize: 40.sp,color: Colors.black,fontWeight: FontWeight.bold),),
              ],
            ),
            Image.asset('assets/necklace/pearl.png',width: 200.w,height: 300.r,fit: BoxFit.fill,)
          ],
        ),
      ),
    );
  }
}
