import 'package:bookly/core/utils/stayles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key}); 
  
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),

                FeaturedBooklistView(),

                SizedBox(height: 20),
  
                Text(
                  "Newset Books",
                  style: AppStyles.textStyle18,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
  
        SliverFillRemaining(
          child: BestSellerListView(),
        ),
      ],
    ));
  }
}
