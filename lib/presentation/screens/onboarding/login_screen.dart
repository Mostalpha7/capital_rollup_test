import 'package:capital_rollup_test/presentation/resource/text_style_definition.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../core/utilities/form_validators.dart';
import '../../resource/color_definition.dart';
import '../../routes/router_definition.dart';
import '../../widgets/component/buttons/cta_button.dart';
import '../../widgets/component/buttons/text_cta_button.dart';
import '../../widgets/component/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorDefinition.kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 65, bottom: 22),
                child: Text(
                  "Login to your account",
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
                        inputName: "Email",
                        hintText: "Enter your email",
                        textEditingController: emailController,
                        textInputAction: TextInputAction.next,
                        validator: (val) => FormValidators.validateField(
                            fieldName: "Email", input: val),
                      ),
                      const SizedBox(height: 22),
                      InputField(
                        inputName: "Password",
                        hintText: "Enter your password",
                        isPasswordField: true,
                        textEditingController: passwordController,
                        textInputAction: TextInputAction.done,
                        validator: (val) => FormValidators.validateField(
                            fieldName: "Password", input: val),
                      ),
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextCTAButton(
                            text: "Forgot Password?",
                            onTap: () {
                              // Navigator.pushNamed(context,
                              //     RouterDefinition.forgotPasswordScreen);
                            },
                            textStyles:
                                TextStyleDefinition.k14fontSize.copyWith(
                              fontSize: 11,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),

                      // Log In btn
                      Padding(
                        padding: const EdgeInsets.only(top: 38, bottom: 54),
                        child: CTAButton(
                          onTap: () async {
                            if ((_formKey.currentState?.validate() ?? false)) {
                              setState(() => loading = true);
                              await Future.delayed(
                                  const Duration(milliseconds: 500), () {});
                              Navigator.popAndPushNamed(
                                  context, RouterDefinition.homeScreen);
                            }
                          },
                          child: Text(
                            "Log In",
                            textAlign: TextAlign.center,
                            style: TextStyleDefinition.k16fontSize
                                .copyWith(color: Colors.white),
                          ),
                          isActive: true,
                          isLoading: loading,
                        ),
                      ),

                      const SizedBox(height: 15),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyleDefinition.k16fontSize.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          children: [
                            const TextSpan(text: "Don’t have an account? "),
                            TextSpan(
                              text: "Sign up",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, RouterDefinition.signUpScreen);
                                },
                            )
                          ],
                        ),
                      ),
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
