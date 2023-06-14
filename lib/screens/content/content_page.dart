import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/constatns/locale_strings.dart';
import 'package:graduation_project/shared/widgets/pdf_veiwer_screen.dart';

class EducationalContentPage extends StatelessWidget {
  const EducationalContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xffF7F9F6),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height / 120,
          backgroundColor: Colors.grey.shade50,
          bottom: TabBar(
            indicatorColor: const Color(0xff090A4A),
            tabs: [
              Tab(
                child: Text(
                  firstSemesterEn.tr,
                  style: TextStyle(
                      color: const Color(0xff090A4A),
                      letterSpacing: 0,
                      fontSize: 15.sp),
                ),
                icon: Text(
                  '1',
                  style: TextStyle(
                      color: const Color(0xff090A4A),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  secondSemesterEn.tr,
                  style: TextStyle(
                      color: const Color(0xff090A4A),
                      letterSpacing: 0,
                      fontSize: 15.sp),
                ),
                icon: Text(
                  '2',
                  style: TextStyle(
                      color: const Color(0xff090A4A),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              //first semester
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 50.h),
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          _buildSubjectItem(
                            'اللغة العربية',
                            'assets/images/arabic_content.png',
                            const PdfViewerScreen(
                              pdfPath:
                                  'https://elearnningcontent.blob.core.windows.net/elearnningcontent/content/2022/primary/primary_1/term_1/Pdf-books/Arabic_1prim_t1.pdf',
                              title: 'اللغة العربية أول',
                            ),
                          ),
                          _buildSubjectItem(
                            'تربية دينية',
                            'assets/images/islam.png',
                            const PdfViewerScreen(
                              pdfPath:
                                  'https://elearnningcontent.blob.core.windows.net/elearnningcontent/content/2022/primary/primary_1/term_1/Pdf-books/deen_islamy_1prim.pdf',
                              title: 'تربية دينية أول',
                            ),
                          ),
                          _buildSubjectItem(
                            'اللغة الإنجليزية',
                            'assets/images/english.png',
                            const PdfViewerScreen(
                              pdfPath:
                                  'https://elearnningcontent.blob.core.windows.net/elearnningcontent/content/2023/primary/primary_1/term_1/Pdf-books/Connect_1Prim_.pdf',
                              title: 'اللغة الإنجليزية أول',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 50.h),
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          _buildSubjectItem(
                            'اللغة العربية',
                            'assets/images/arabic2.png',
                            const PdfViewerScreen(
                              pdfPath:
                                  'https://elearnningcontent.blob.core.windows.net/elearnningcontent/content/2023/primary/primary_1/term_2/Pdf-books/arabic%201_prim_t2.pdf',
                              title: 'اللغة العربية ثان',
                            ),
                          ),
                          _buildSubjectItem(
                            'تربية دينية',
                            'assets/images/islam2.png',
                            const PdfViewerScreen(
                              pdfPath:
                                  'https://elearnningcontent.blob.core.windows.net/elearnningcontent/content/2023/primary/primary_1/term_2/Pdf-books/deen_islamy_1prim_t2.pdf',
                              title: ' تربية دينية ثان',
                            ),
                          ),
                          _buildSubjectItem(
                            'اللغة الإنجليزية',
                            'assets/images/english2.png',
                            const PdfViewerScreen(
                              pdfPath:
                                  'https://elearnningcontent.blob.core.windows.net/elearnningcontent/content/2023/primary/primary_1/term_2/Pdf-books/deen_islamy_1prim_t2.pdf',
                              title: ' اللغة الإنجليزية ثان',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectItem(String title, String imgPath, Widget content) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      child: InkWell(
        onTap: () => Get.to(content),
        child: Row(
          children: [
            Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(-5, -5),
                        blurRadius: 15,
                        spreadRadius: 0.3),
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5, 5),
                        blurRadius: 2,
                        spreadRadius: 1),
                  ],
                  image: DecorationImage(
                      image: AssetImage(
                        imgPath,
                      ),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              width: 30.w,
            ),
            Text(title,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff090A4A)))
          ],
        ),
      ),
    );
  }
}
