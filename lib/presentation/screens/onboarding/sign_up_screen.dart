import 'package:capital_rollup_test/presentation/resource/text_style_definition.dart';
import 'package:capital_rollup_test/presentation/widgets/app/custom_app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/enums.dart';
import '../../../core/utilities/form_validators.dart';
import '../../resource/color_definition.dart';
import '../../widgets/app/custom_app_bar_leading.dart';
import '../../widgets/component/buttons/cta_button.dart';
import '../../widgets/component/input_field.dart';
import '../../widgets/component/snackbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Widget buildSpacer() => const SizedBox(height: 22);

  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswprdController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: const CustomAppBarLeading()),
      backgroundColor: ColorDefinition.kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 22),
                child: Text(
                  "Create log In details",
                  style: TextStyleDefinition.k16fontSize.copyWith(fontSize: 22),
                ),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      InputField(
                        inputName: "Full name",
                        hintText: "Full your last name",
                        textEditingController: lastNameController,
                        textInputAction: TextInputAction.next,
                        validator: (val) => FormValidators.validateField(
                            fieldName: "Last name", input: val),
                      ),
                      buildSpacer(),

                      InputField(
                        inputName: "Email",
                        hintText: "Enter your email",
                        textEditingController: emailController,
                        validator: (val) => FormValidators.validateEmail(val),
                        textInputAction: TextInputAction.next,
                      ),
                      buildSpacer(),

                      InputField(
                        inputName: "Password",
                        hintText: "Enter your password",
                        isPasswordField: true,
                        textEditingController: passwordController,
                        textInputAction: TextInputAction.next,
                        validator: (v) => FormValidators.validatePassword(v),
                      ),

                      buildSpacer(),
                      InputField(
                        inputName: "Confirm Password",
                        hintText: "Confirm your password",
                        isPasswordField: true,
                        textEditingController: confirmPasswprdController,
                        textInputAction: TextInputAction.done,
                        onChanged: (_) => setState(() {}),
                      ),
                      buildSpacer(),

                      // Sign Up btn
                      const SizedBox(height: 10),
                      CTAButton(
                        isLoading: loading,
                        onTap: () async {
                          if (passwordController.text !=
                              confirmPasswprdController.text) {
                            showCustomSnackBar(
                              context: context,
                              type: NotificationType.error,
                              text:
                                  "Password and confirm password should be the same",
                            );
                          } else if (!(_formKey.currentState?.validate() ??
                              false)) {
                          } else {
                            setState(() => loading = true);
                            await Future.delayed(
                                const Duration(milliseconds: 1500), () {});
                            setState(() => loading = false);
                            showCustomSnackBar(
                                context: context,
                                text: "Account creation was sucessful.",
                                type: NotificationType.success);
                            await Future.delayed(
                                const Duration(milliseconds: 800), () {});
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Sign up",
                            textAlign: TextAlign.center,
                            style: TextStyleDefinition.k16fontSize
                                .copyWith(color: Colors.white)),
                        isActive: true,
                      ),

                      buildSpacer(),

                      const Text(
                        "By clicking on the sign up button, you are acknowledging to our terms and conditions",
                        style: TextStyleDefinition.k12fontSize,
                      ),

                      const SizedBox(height: 42),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyleDefinition.k16fontSize,
                          children: [
                            const TextSpan(
                                text: "Have an account? ",
                                style: TextStyle(color: Color(0xff919191))),
                            TextSpan(
                              text: "Sign In",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 50)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
