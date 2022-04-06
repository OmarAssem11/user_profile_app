import 'package:final_project/core/presentation/widgets/custom_elevated_button.dart';
import 'package:final_project/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/screens/login_screen.dart';
import 'package:final_project/features/auth/presentation/widgets/logout_widget.dart';
import 'package:final_project/features/profile/presentation/bloc/view_profile_cubit/view_profile_cubit.dart';
import 'package:final_project/features/profile/presentation/bloc/view_profile_cubit/view_profile_state.dart';
import 'package:final_project/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:final_project/features/profile/presentation/widgets/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen();
  static const routeName = 'view_profile';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          LogoutWidget(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).logout();
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          ),
        ],
      ),
      body: BlocBuilder<ViewProfileCubit, ViewProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () {
              WidgetsBinding.instance!.addPostFrameCallback(
                (_) => BlocProvider.of<ViewProfileCubit>(context).viewProfile(),
              );
              return Container();
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            success: (user) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * .28,
                    child: Stack(
                      children: [
                        Container(
                          height: screenHeight * .23,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/cover.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: (screenWidth * .5) - 60,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                user.imageUrl,
                              ),
                              radius: 55,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  ProfileItemWidget(
                    text: user.email,
                    icon: Icons.email_outlined,
                  ),
                  ProfileItemWidget(
                    text: user.phone,
                    icon: Icons.phone_outlined,
                  ),
                  ProfileItemWidget(
                    text: user.address,
                    icon: Icons.home_work_outlined,
                  ),
                  ProfileItemWidget(
                    text: user.age,
                    icon: Icons.manage_accounts_outlined,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: CustomElevatedButton(
                      label: 'edit',
                      onPressed: () => Navigator.of(context).pushNamed(
                        EditProfileScreen.routeName,
                        arguments: user,
                      ),
                      isLoading: false,
                    ),
                  ),
                ],
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}
