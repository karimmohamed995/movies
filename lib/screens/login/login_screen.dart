import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/providers/language_provider.dart';
import 'package:movies/screens/login/cubit/login_cubit.dart';
import 'package:movies/screens/login/cubit/login_state.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/dialog_utils.dart';
import 'package:movies/widgets/custom_button.dart';
import 'package:movies/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  // LoginCubit viewModel = getIt();
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginCubit viewModel = getIt();
  int selectedIndex = 0;
  final List<String> flags = ['assets/images/EG.png', 'assets/images/LR.png'];
  // late AppLocalizations l10n;
  // bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    // languageProvider = Provider.of(context);
    // themeProvider = Provider.of(context);
    // l10n = AppLocalizations.of(context)!;
    return BlocListener<LoginCubit, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state.loginApi.hasData) {
          Navigator.pop(context);
          print("state.loginApi.hasData");
          Navigator.push(context, AppRoutes.home);
        } else if (state.loginApi.hasError) {
          Navigator.pop(context);
          debugPrint("❌ Login Error: ${state.loginApi.getError.message}");
          showMessage(
            context,
            title: "Error",
            content: "${state.loginApi.getError.message}",
            posBtnTitle: "Ok",
          );
        } else if (state.loginApi.isLoading) {
          showLoading(context);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24),
                buildAppLogo(context),
                SizedBox(height: 24),
                buildEmailTextField(),
                SizedBox(height: 16),
                buildPasswordTextField(),
                SizedBox(height: 16),
                buildForgetPasswordText(context),
                SizedBox(height: 24),
                buildLoginButton(),
                SizedBox(height: 24),
                buildSignUpText(),
                SizedBox(height: 24),
                buildOrRow(),
                SizedBox(height: 24),
                buildGoogleLogin(),
                SizedBox(height: 24),
                // buildLanguageToggle(),
                // SizedBox(height: 24),
                // buildThemeToggle(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildAppLogo(BuildContext context) => Image.asset(
    AppAssets.logo,
    height: MediaQuery.of(context).size.height * 0.2,
  );

  buildEmailTextField() => Container(
    child: CustomTextField(
      hint: "Email",
      prefixIcon: AppAssets.emailIcon,
      controller: emailController,
    ),
  );

  buildPasswordTextField() => Container(
    child: CustomTextField(
      hint: "Password",
      prefixIcon: AppAssets.passIcon,
      isPassword: true,
      controller: passwordController,
    ),
  );

  buildForgetPasswordText(BuildContext context) => Container(
    width: double.infinity,
    child: Text(
      "Forget Password ?",
      textAlign: TextAlign.end,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
        // fontStyle: FontStyle.italic,
        fontSize: 14,
        // decoration: TextDecoration.underline,
        color: AppColors.yellow,
        fontWeight: FontWeight.normal,
        // decorationColor: AppColors.yellow,
      ),
    ),
  );

  buildLoginButton() => CustomButton(
    text: "Login",
    onClick: () {
      viewModel.login(emailController.text, passwordController.text);
    },
    // onClick: () async {
    //   showLoading(context);
    //   await Future.delayed(Duration(seconds: 2));

    //   // showLoading(context);
    //   try {
    //     var userCredential = await FirebaseAuth.instance
    //         .signInWithEmailAndPassword(
    //           email: emailController.text,
    //           password: passwordController.text,
    //         );
    //     UserDM.currentUser = await getFromUserFirestore(
    //       userCredential.user!.uid,
    //     );
    //     Navigator.pop(context); // hide loading
    //     Navigator.pushReplacement(context, AppRoutes.home);
    //   } on FirebaseAuthException catch (e) {
    //     // var message = "email or password wrong";
    //     var message =
    //         e.message ?? "Something went wrong, Please try again later!";
    //     // if (e.code == 'user-not-found') {
    //     //   print('No user found for that email.');
    //     // } else if (e.code == 'wrong-password') {
    //     //   print('Wrong password provided for that user.');
    //     // }
    //     Navigator.pop(context);
    //     showMessage(context, content: message, posBtnTitle: "Ok");
    //   }
    //   // showMessage(
    //   //   context,
    //   //   title: "title",
    //   //   content: "Content",
    //   //   posBtnTitle: "ok",
    //   // );
    // },
  );

  buildSignUpText() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "don't have an account ? ",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(context, AppRoutes.register);
        },
        child: Text(
          "Create One",

          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: AppColors.yellow,
          ),
        ),
      ),
    ],
  );

  buildOrRow() => Row(
    children: [
      Expanded(
        child: Divider(indent: 24, endIndent: 24, color: AppColors.yellow),
      ),
      Text("OR", style: TextStyle(color: AppColors.yellow, fontSize: 15)),
      Expanded(
        child: Divider(indent: 24, endIndent: 24, color: AppColors.yellow),
      ),
    ],
  );

  buildGoogleLogin() => CustomButton(
    image: Image.asset(
      AppAssets.googleIcon,
      width: 24,
      height: 24,
      color: AppColors.black,
    ),
    text: "Login With Google",

    onClick: () {},

    // onClick: () async {
    //   showLoading(context);
    //   try {
    //     final userCredential = await AuthService().signInWithGoogle();

    //     Navigator.pop(context); // remove loading

    //     // navigate to home
    //     // Navigator.pushReplacement(context, AppRoutes.home);
    //   } catch (e) {
    //     Navigator.pop(context); // remove loading
    //     showMessage(
    //       context,
    //       content: "Error Register with Google\n$e",
    //       posBtnTitle: "Ok",
    //     );
    //   }
    // },
    // backgroundcolor: Theme.of(context).brightness == Brightness.dark
    //     ? AppColors
    //           .darkPurple // اللون في الـ dark mode
    //     : AppColors.white,
  );

  // late LanguageProvider languageProvider;
  // late ThemeProvider themeProvider;

  // buildLanguageToggle() => AnimatedToggleSwitch<String>.dual(
  //   current: languageProvider.currentLocale,
  //   iconBuilder: (language) =>
  //       Image.asset(language == "ar" ? AppAssets.egIcon : AppAssets.usIcon),
  //   first: "ar",
  //   second: "en",
  //   onChanged: (language) {
  //     languageProvider.changeLanguage(language);
  //     setState(() {});
  //   },
  // );

  // buildThemeToggle() => AnimatedToggleSwitch<ThemeMode>.dual(
  //   // current: themeProvider.mode,
  //   current: ThemeMode.dark,
  //   iconBuilder: (mode) =>
  //       Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
  //   first: ThemeMode.light,
  //   second: ThemeMode.dark,
  //   onChanged: (mode) {
  //     // themeProvider.changeMode(mode);
  //     setState(() {});
  //   },
  // );

  // buildLanguageToggle() => Container(
  //   width: MediaQuery.of(context).size.width * 0.3,
  //   child: AnimatedToggleSwitch<int>.rolling(
  //     current: selectedIndex,
  //     values: [0, 1],
  //     onChanged: (i) => setState(() => selectedIndex = i),
  //     iconBuilder: (value, isSelected) =>
  //         Image.asset(flags[value], width: 27, height: 27, fit: BoxFit.contain),
  //     style: ToggleStyle(
  //       backgroundColor: Colors.transparent, // خلفية التوجّل
  //       indicatorColor: Colors.deepPurple, // لون الزر المتحرك
  //       borderRadius: BorderRadius.circular(32),
  //       indicatorBorder: Border.all(
  //         color: Colors.deepPurple,
  //         width: 3,
  //       ), // بوردر الزر المتحرك
  //       borderColor: Colors.deepPurple, // لون البوردر الخارجي
  //       // borderWidth: 2, // سُمك البوردر
  //     ),
  //     height: 48,
  //     spacing: 4,
  //   ),
  // );
}
