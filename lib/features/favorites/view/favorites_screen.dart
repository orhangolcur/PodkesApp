import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../favorites/cubit/favorite_cubit.dart';
import '../../favorites/cubit/favorite_state.dart';
import '../../../shared/widgets/empty_message.dart';
import 'widgets/favorite_list_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B2D),
      appBar: AppBar(
        title: Text(
          'Library',
          style: TextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 800.w),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteUpdated) {
                  final favorites = state.favorites;

                  if (favorites.isEmpty) {
                    return const EmptyMessage(
                      title: 'No favorites yet',
                      subtitle: 'You haven\'t liked any podcast yet.',
                      icon: Icons.favorite_border,
                    );
                  }

                  return ListView.separated(
                    itemCount: favorites.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10.h),
                    itemBuilder: (context, index) {
                      return FavoriteListItem(podcast: favorites[index]);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
