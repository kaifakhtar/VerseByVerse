import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';




import '../manager/ChapterListAndDataProvider.dart';
import '../manager/Hilali_ayah_data_provider.dart';
import '../widgets/next_verse_button.dart';
import '../widgets/popUpmenu.dart';
import '../widgets/prev_verse_button.dart';
import '../widgets/verse_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoaded = false;


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: const Color(0xffE8EBF3),
      appBar: AppBar(
        elevation: 2.h,
        title: Text("VerseByVerse",
        style: GoogleFonts.poppins(),),
        backgroundColor: Color(0xff2B5BBB),
        actions: [PopUp()],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              VerseCard(),
              SizedBox(height: 20.h,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrevVerseButton(),
                  //SizedBox(width: screenWidth*0.01),
                  NextVerseButton(),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final hilaliAyahDataProvider = Provider.of<HilaliAyahDataProvider>(context,listen: false);
      hilaliAyahDataProvider.getHilaliAyahDataEntity();
      final  chapterListAndDataProvider= Provider.of<ChapterListAndDataProvider>(context,listen: false);
      chapterListAndDataProvider.getchapterListDataEntity();
    });



  }

}
