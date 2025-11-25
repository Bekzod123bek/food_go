import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo/colors/app_colors.dart';
import 'package:foodgo/screens/auth/sigup_screen.dart';
import 'package:foodgo/service/storage_service.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/account_container.dart';
import '../../widgets/info_icon.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEnabled = false;
  bool isOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        centerTitle: true,
        title: Text(
          'Account',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
        
            Column(
              children: [
                SizedBox(
                  height: 88,
                  width: 88,
                  child: CircleAvatar(
                    radius: 200,
                    child: Image.asset(Assets.images.men.path,errorBuilder: (context, error, stackTrace) => Text("internet yo'q"),),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  StorageService.getInfo('email'),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  StorageService.getInfo('password'),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 24),
        
                AccountContainer(
                  title: 'My Account',
                  children: [
                    InfoIcon(
                      icon: Assets.icons.accountIcon.person,
                      text: 'Personal information',
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        InfoIcon(
                          icon: Assets.icons.accountIcon.world,
                          text: 'Language',
                        ),
                        const Spacer(),
                        Text(
                          'English (US)',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    InfoIcon(
                      icon: Assets.icons.accountIcon.info,
                      text: 'Privacy Policy',
                    ),
                    const SizedBox(height: 12),
                    InfoIcon(
                      icon: Assets.icons.accountIcon.setting,
                      text: 'Setting',
                    ),
                  ],
                ),
        
                const SizedBox(height: 16),
        
                AccountContainer(
                  title: 'Notifications',
                  children: [
                    Row(
                      children: [
                        InfoIcon(
                          icon: Assets.icons.bell,
                          size: 17,
                          text: 'Push Notifications',
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            value: isOff,
                            onChanged: (value) {
                              setState(() {
                                isOff = value;
                              });
                            },
                            activeThumbColor: AppColors.white,
                            activeTrackColor: AppColors.lightgreen,
                            inactiveTrackColor: AppColors.greyswich,
                            inactiveThumbColor: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InfoIcon(
                          icon: Assets.icons.bell,
                          size: 17,
                          text: 'Promotional Notifications',
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: 0.6,
                          child: Switch(
                            value: isEnabled,
                            onChanged: (value) {
                              setState(() {
                                isEnabled = value;
                              });
                            },
                            activeThumbColor: AppColors.white,
                            activeTrackColor: AppColors.lightgreen,
                            inactiveTrackColor: AppColors.greyswich,
                            inactiveThumbColor: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16,),
        
                AccountContainer(
                  title: 'More',
                  children: [
                    InfoIcon(
                      icon: Assets.icons.accountIcon.info,
                      text: 'Help Center',
                    ),
                    SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog.adaptive(
                            title: Text('Chiqishni tasdiqlaysizmi ?'),
                            content: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CupertinoButton.filled(
                                      child: Text('Ha'),
                                      onPressed: () {
        
                                        StorageService.removeData('email');
                                        StorageService.removeData('password');
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Signup_Screen()), (_)=>false);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: CupertinoButton.filled(
                                      child: Text('Yo\'q'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: InfoIcon(
                        icon: Assets.icons.accountIcon.out,
                        text: 'Log Out',
                        iconColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

