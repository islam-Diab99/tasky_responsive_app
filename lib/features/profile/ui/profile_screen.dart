import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/Core/constatnts.dart';
import 'package:tasky/Core/helpers/utils_functions.dart';
import 'package:tasky/Core/theming/styles.dart';
import 'package:tasky/Core/widgets/custom_app_bar.dart';
import 'package:tasky/features/profile/logic/profile_cubit.dart';
import 'package:tasky/features/profile/logic/profile_states.dart';
import 'package:tasky/features/profile/ui/widgets/profile_info_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomAppBar(
              screenTitle: AppConstants.profile,
            ),
            Expanded(
              child: BlocConsumer<ProfileCubit, ProfileStates>(
                listener: (context, state) {
                  if (state is ProfileError) {
                    setupErrorState(context, state.error);
                  }
                },
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return _buildLoading();
                  } else if (state is ProfileSuccess) {
                    return UserInformationListView(
                      userInformation: state.data,
                    );
                  } else {
                    return _buildEmptyState();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        'No profile data available',
        style: TextStyles.font16GreyRegular,
      ),
    );
  }
}
