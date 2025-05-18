import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B2D),
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600.w),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 48.r,
                      backgroundImage: const AssetImage('assets/images/profile.jpg'),
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      'Orhan Gölcür',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),

                    Text(
                      'orhangolcur0@gmail.com',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.h),

                    _buildProfileCard(
                      icon: Icons.favorite_border,
                      title: 'Favorites',
                      onTap: () => context.go("/favorites"),
                    ),
                    SizedBox(height: 12.h),

                    _buildProfileCard(
                      icon: Icons.info_outline,
                      title: 'About Podkes',
                      onTap: () {
                        showAboutDialog(
                          context: context,
                          applicationName: 'Podkes',
                          applicationVersion: 'v1.0.0',
                          applicationIcon: Icon(Icons.podcasts, size: 32.sp),
                          children: [
                            Text(
                              'Podkes is a podcast discovery app that allows you to explore and listen to trending episodes from all over the world.',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 12.h),

                    _buildProfileCard(
                      icon: Icons.star_border,
                      title: 'Rate Podkes',
                      onTap: () {
                        int selectedRating = 0;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: const Color(0xFF262033),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Rate Podkes',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        Text(
                                          'How would you rate our app?',
                                          style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                                        ),
                                        SizedBox(height: 20.h),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: List.generate(5, (index) {
                                            final starIndex = index + 1;
                                            return IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(),
                                              iconSize: 32.sp,
                                              onPressed: () =>
                                                  setState(() => selectedRating = starIndex),
                                              icon: Icon(
                                                selectedRating >= starIndex
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color: Colors.amber,
                                              ),
                                            );
                                          }),
                                        ),
                                        SizedBox(height: 24.h),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.white70, fontSize: 14.sp),
                                              ),
                                              onPressed: () => Navigator.pop(context),
                                            ),
                                            SizedBox(width: 8.w),
                                            TextButton(
                                              child: Text(
                                                'Submit',
                                                style: TextStyle(
                                                    color: Colors.amber, fontSize: 14.sp),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                if (selectedRating > 0) {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Thanks for rating us $selectedRating star${selectedRating > 1 ? 's' : ''}!',
                                                        style: TextStyle(fontSize: 14.sp),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = const Color(0xFF262033),
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 22.sp),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}
