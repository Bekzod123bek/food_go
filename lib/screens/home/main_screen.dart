import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodgo/colors/app_colors.dart';
import 'package:foodgo/cubit/bottom_bar/main_cubit.dart';
import 'package:foodgo/cubit/bottom_bar/main_state.dart';

import '../../gen/assets.gen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit,MainState>(
      builder: (context,state) {
        if (state is MainInitialState){
          return Scaffold(
            backgroundColor: AppColors.white,
            body: state.pages[state.currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color:AppColors.lightgrey,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),


              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  backgroundColor: AppColors.white,
                  elevation: 0,
                  onTap:(value) {
                    context.read<MainCubit>().onBottonNavBar(value);
                  },
                  currentIndex: state.currentIndex,
                  type: BottomNavigationBarType.shifting,
                  selectedItemColor: Colors.green,
                  unselectedItemColor: Colors.grey,

                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        Assets.icons.bottomBar.home,colorFilter: ColorFilter.mode(
                        state.currentIndex == 0 ? AppColors.green : AppColors.grey,
                        BlendMode.srcIn,

                      ),

                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        Assets.icons.search,width:28,height:28,colorFilter: ColorFilter.mode(
                        state.currentIndex == 1 ?  AppColors.green : AppColors.grey,
                        BlendMode.srcIn,

                      ),

                      ),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        Assets.icons.bottomBar.user,colorFilter: ColorFilter.mode(
                        state.currentIndex == 2 ? AppColors.green : AppColors.grey,
                        BlendMode.srcIn,

                      ),

                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          );
      }else{
          return SizedBox();
        }
      }
    );
  }
}