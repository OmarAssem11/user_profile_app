import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile/core/presentation/widgets/custom_elevated_button.dart';
import 'package:user_profile/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:user_profile/features/auth/presentation/screens/login_screen.dart';
import 'package:user_profile/features/auth/presentation/widgets/logout_widget.dart';
import 'package:user_profile/features/profile/presentation/bloc/view_profile_cubit/view_profile_cubit.dart';
import 'package:user_profile/features/profile/presentation/bloc/view_profile_cubit/view_profile_state.dart';
import 'package:user_profile/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:user_profile/features/profile/presentation/widgets/profile_item.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen();
  static const routeName = 'view_profile';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final textTheme = Theme.of(context).textTheme;
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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * .29,
                      child: Stack(
                        children: [
                          Container(
                            height: screenHeight * .22,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
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
                            left: (screenWidth * .5) - 78,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.name,
                          style: textTheme.headline1,
                        ),
                        const SizedBox(width: 6),
                        const CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 9,
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    ProfileItem(
                      text: user.address,
                      prefix: 'Address: ',
                      icon: Icons.location_on,
                    ),
                    ProfileItem(
                      text: user.email,
                      prefix: 'Email: ',
                      icon: Icons.email_rounded,
                    ),
                    ProfileItem(
                      text: user.phone,
                      prefix: 'Phone: ',
                      icon: Icons.phone,
                    ),
                    ProfileItem(
                      text: user.age,
                      prefix: 'Age: ',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 12),
                    CustomElevatedButton(
                      label: 'edit',
                      onPressed: () => Navigator.of(context).pushNamed(
                        EditProfileScreen.routeName,
                        arguments: user,
                      ),
                      isLoading: false,
                    ),
                  ],
                ),
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}
