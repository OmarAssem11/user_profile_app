import 'dart:io';
import 'package:final_project/core/domain/entities/user.dart';
import 'package:final_project/core/domain/error/error_toast.dart';
import 'package:final_project/core/presentation/validation/validators.dart';
import 'package:final_project/core/presentation/widgets/custom_elevated_button.dart';
import 'package:final_project/core/presentation/widgets/custom_text_form_field.dart';
import 'package:final_project/features/profile/presentation/bloc/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:final_project/features/profile/presentation/bloc/edit_profile_cubit/edit_profile_state.dart';
import 'package:final_project/features/profile/presentation/screens/view_profile_screen.dart';
import 'package:final_project/features/profile/presentation/widgets/edit_profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen();
  static const routeName = 'edit_profile';
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments! as User;
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: user.name);
    final emailController = TextEditingController(text: user.email);
    final passwordController = TextEditingController();
    final phoneController = TextEditingController(text: user.phone);
    final addressController = TextEditingController(text: user.address);
    final ageController = TextEditingController(text: user.age);
    File? imageFile;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<EditProfileCubit, EditProfileState>(
            builder: (context, state) {
              bool isLoading = false;
              state.maybeWhen(
                loading: () => isLoading = true,
                error: (error) => showErrorToast(errorMessage: error),
                success: () {
                  WidgetsBinding.instance!.addPostFrameCallback(
                    (_) {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context)
                          .pushReplacementNamed(ViewProfileScreen.routeName);
                    },
                  );
                },
                orElse: () {},
              );
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    EditProfileImageWidget(
                      imageUrl: user.imageUrl,
                      onPressed: () async {
                        imageFile = await _getImage();
                      },
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'Change name',
                      keyboardType: TextInputType.name,
                      validator: (value) => generalValidator(
                        value: value,
                        fieldName: 'Name',
                      ),
                      prefixIcon: Icons.person_outline,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Change email address',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => emailValidator(value),
                      prefixIcon: Icons.email_outlined,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Change password',
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) => editPasswordValidator(value),
                      prefixIcon: Icons.lock_outline,
                    ),
                    CustomTextFormField(
                      controller: phoneController,
                      hintText: 'Change phone number',
                      keyboardType: TextInputType.phone,
                      validator: (value) => phoneValidator(value),
                      prefixIcon: Icons.phone_outlined,
                    ),
                    CustomTextFormField(
                      controller: addressController,
                      hintText: 'Change address',
                      keyboardType: TextInputType.name,
                      validator: (value) => generalValidator(
                        value: value,
                        fieldName: 'Address',
                      ),
                      prefixIcon: Icons.home_work_outlined,
                    ),
                    CustomTextFormField(
                      controller: ageController,
                      hintText: 'Change age',
                      keyboardType: TextInputType.number,
                      validator: (value) => generalValidator(
                        value: value,
                        fieldName: 'Age',
                      ),
                      prefixIcon: Icons.manage_accounts_outlined,
                    ),
                    const SizedBox(height: 16),
                    CustomElevatedButton(
                      label: 'submit',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<EditProfileCubit>(context)
                              .editProfile(
                            user: User(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text.isEmpty
                                  ? user.password
                                  : passwordController.text,
                              phone: phoneController.text,
                              imageUrl: user.imageUrl,
                              address: addressController.text,
                              age: ageController.text,
                            ),
                            imageFile: imageFile,
                          );
                        }
                      },
                      isLoading: isLoading,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<File?> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
