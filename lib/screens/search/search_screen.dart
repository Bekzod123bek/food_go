import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodgo/colors/app_colors.dart';
import 'package:foodgo/cubit/search/search_cubit.dart';
import 'package:foodgo/cubit/search/search_state.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../gen/assets.gen.dart';
import '../details/home_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.hasBack});


  final bool hasBack;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    context.read<SearchCubit>().chiqish();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(toolbarHeight: 65,

        backgroundColor: AppColors.green,

        leadingWidth: 56,
        centerTitle: false,
        leading: Visibility(
          visible: widget.hasBack,
          child: IconButton(
            constraints: BoxConstraints(),
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(Assets.icons.left,height: 34,width: 34,),
          ),
        ),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.white,
          ),

          height: 47,
          child: TextField(
            onChanged: (input) {
              context.read<SearchCubit>().searchResturants(input);
            },
            decoration: const InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchErrorState) {
            return Center(
              child: Text('Xatolik: '),
            );
          } else if (state is SearchSuccessState) {
            if (state.data.isEmpty) {
              return const Center(
                child: Text('Natija topilmadi'),
              );
            }

            return GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 300,
                mainAxisSpacing: 10,
              ),
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        resturant: state.data[index],
                      ),
                    ),
                  ),
                  child: Card(
                    color: AppColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            state.data[index].image,
                            height: 170,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 200,
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.restaurant,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 200,
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.data[index].name ,
                                style: GoogleFonts.poppins(                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColors.black
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.data[index].location ,
                                style: GoogleFonts.poppins(
                                  color: AppColors.grey,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Wrap(
                                spacing: 2,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  SvgPicture.asset(Assets.icons.starFull, height: 16),
                                  SvgPicture.asset(Assets.icons.starFull, height: 17),
                                  SvgPicture.asset(Assets.icons.starFull, height: 18),
                                  SvgPicture.asset(Assets.icons.starFull, height: 19),
                                  SvgPicture.asset(Assets.icons.star, height: 20),
                                  SizedBox(width: 4),
                                  Text(
                                    state.data[index].rating.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),

                                ],
                              ),
                              Text(
                                state.data[index].phoneNumber,
                                style: GoogleFonts.poppins(                                  color: AppColors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return  SizedBox();
          }
        },
      ),
    );
  }
}