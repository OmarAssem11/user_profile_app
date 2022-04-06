import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile/core/domain/entities/user.dart';
import 'package:user_profile/core/presentation/util/error_toast.dart';
import 'package:user_profile/core/presentation/validation/validators.dart';
import 'package:user_profile/core/presentation/widgets/custom_elevated_button.dart';
import 'package:user_profile/core/presentation/widgets/custom_text_form_field.dart';
import 'package:user_profile/core/presentation/widgets/password_text_form_field.dart';
import 'package:user_profile/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:user_profile/features/auth/presentation/bloc/auth_state.dart';
import 'package:user_profile/features/auth/presentation/screens/login_screen.dart';
import 'package:user_profile/features/profile/presentation/screens/view_profile_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();
  static const routeName = 'register';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextTheme textTheme;
  @override
  void didChangeDependencies() {
    textTheme = Theme.of(context).textTheme;
    super.didChangeDependencies();
  }

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'REGISTER',
                style: textTheme.headline1,
              ),
              CustomTextFormField(
                controller: nameController,
                hintText: 'Full name',
                prefixIcon: Icons.person_outline,
                keyboardType: TextInputType.name,
                validator: (value) => generalValidator(
                  value: value,
                  fieldName: 'Name',
                ),
              ),
              CustomTextFormField(
                controller: emailController,
                hintText: 'Email Address',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => emailValidator(value),
              ),
              PasswordTextFormField(controller: passwordController),
              CustomTextFormField(
                controller: phoneController,
                hintText: 'Phone number',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (value) => phoneValidator(value),
              ),
              const SizedBox(height: 16),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  bool isLoading = false;
                  state.maybeWhen(
                    loading: () => isLoading = true,
                    error: (error) => showErrorToast(errorMessage: error),
                    success: () =>
                        WidgetsBinding.instance!.addPostFrameCallback(
                      (_) => Navigator.of(context).pushReplacementNamed(
                        ViewProfileScreen.routeName,
                      ),
                    ),
                    orElse: () {},
                  );
                  return CustomElevatedButton(
                    label: 'register',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).register(
                          user: User(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            imageUrl: '',
                            phone: phoneController.text,
                            address: '',
                            age: '',
                          ),
                        );
                      }
                    },
                    isLoading: isLoading,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: textTheme.headline2,
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName),
                    child: const Text('LOGIN'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
