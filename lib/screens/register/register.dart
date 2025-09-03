import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// import 'package:evently/data/firestore_utils.dart';
// import 'package:evently/l10n/app_localizations.dart';
// import 'package:evently/model/user_dm.dart';
// import 'package:evently/services/auth_service.dart';
// import 'package:evently/ui/providers/language_provider.dart';
// import 'package:evently/ui/providers/theme_provider.dart';
// import 'package:evently/ui/utilities/app_assets.dart';
// import 'package:evently/ui/utilities/app_routes.dart';
// import 'package:evently/ui/utilities/dialog_utils.dart';
// import 'package:evently/ui/widgets/custom_button.dart';
// import 'package:evently/ui/widgets/custom_text_field.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/providers/language_provider.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/widgets/custom_button.dart';
import 'package:movies/widgets/custom_text_field.dart';
// import 'package:provider/provider.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _LoginState();
}

class _LoginState extends State<Register> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  int selectedIndex = 0;
  final List<String> flags = ['assets/images/EG.png', 'assets/images/LR.png'];
  // late AppLocalizations l10n;
  // bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    // languageProvider = Provider.of(context);
    // themeProvider = Provider.of(context);
    // l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text("Register"),
        iconTheme: IconThemeData(color: AppColors.yellow),
        titleTextStyle: TextStyle(color: AppColors.yellow),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(height: 24),
                buildAppLogo(context),
                SizedBox(height: 24),
                buildNameTextField(),
                SizedBox(height: 16),
                buildEmailTextField(),
                SizedBox(height: 16),
                buildPasswordTextField(),
                SizedBox(height: 16),
                buildRetypePasswordTextField(),
                SizedBox(height: 16),
                buildPhoneTextField(),
                SizedBox(height: 24),
                buildRegisterButton(),
                SizedBox(height: 24),
                buildSignUpText(),
                SizedBox(height: 24),
                buildLanguageToggle(),
                // buildOrRow(),
                // SizedBox(height: 24),
                // buildGoogleLogin(),
                // SizedBox(height: 24),
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

  buildNameTextField() => Container(
    child: CustomTextField(
      // hint: l10n.nameHint,
      hint: "User Name",
      prefixIcon: AppAssets.userIcon,
      controller: userNameController,
    ),
  );

  buildEmailTextField() => Container(
    child: CustomTextField(
      // hint: l10n.emailHint,
      hint: "Email",
      prefixIcon: AppAssets.emailIcon,
      controller: emailController,
    ),
  );

  buildPasswordTextField() => Container(
    child: CustomTextField(
      // hint: l10n.passwordHint,
      hint: "Password",
      prefixIcon: AppAssets.passIcon,
      isPassword: true,
      controller: passwordController,
    ),
  );
  buildRetypePasswordTextField() => Container(
    child: CustomTextField(
      // hint: l10n.rePassword,
      hint: "Re Password",
      prefixIcon: AppAssets.passIcon,
      isPassword: true,
      controller: rePasswordController,
    ),
  );
  buildPhoneTextField() => Container(
    child: CustomTextField(
      // hint: l10n.nameHint,
      hint: "PhoneNumber",
      prefixIcon: AppAssets.phone,
      controller: userNameController,
    ),
  );

  buildRegisterButton() => CustomButton(
    // text: l10n.createAccountt,
    text: "Create Account",
    onClick: () {},
    // onClick: () async {
    //   showLoading(context);
    //   await Future.delayed(Duration(seconds: 2));

    //   // showLoading(context);
    //   try {
    //     var userCredential = await FirebaseAuth.instance
    //         .createUserWithEmailAndPassword(
    //           email: emailController.text,
    //           password: passwordController.text,
    //         );

    //     UserDM.currentUser = UserDM(
    //       id: userCredential.user!.uid,
    //       name: userNameController.text,
    //       email: emailController.text,
    //       favoriteEvents: [],
    //     );
    //     addUserToFirestore(UserDM.currentUser!);
    //     Navigator.pop(context); // hide loading

    //     Navigator.push(context, AppRoutes.home);
    //   } on FirebaseAuthException catch (e) {
    //     var message = "email or password wrong";
    //     if (e.code == "weak-password") {
    //       message = "password is weak";
    //     } else if (e.code == "email-already-in-use") {
    //       message = "account already exist ";
    //     }
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
        // l10n.alreadyHaveAccount,
        "Already Have an account ?",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(context, AppRoutes.register);
        },
        child: Text(
          // l10n.loginButton,
          "Login",
          style: TextStyle(
            color: AppColors.yellow,
            // fontStyle: FontStyle.italic,
            // decoration: TextDecoration.underline,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );

  buildOrRow() => Row(
    children: [
      Expanded(child: Divider(indent: 24, endIndent: 24)),
      Text(
        "OR",

        // l10n.orText,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      Expanded(child: Divider(indent: 24, endIndent: 24)),
    ],
  );

  buildGoogleLogin() => CustomButton(
    image: Image.asset(AppAssets.googleIcon, width: 24, height: 24),
    // text: l10n.loginWithGoogle,
    text: "Login With Google",
    onClick: () {},
    // onClick: () async {
    //   showLoading(context);
    //   try {
    //     final userCredential = await AuthService().signInWithGoogle();

    //     Navigator.pop(context); // remove loading

    //     // navigate to home
    //     Navigator.pushReplacement(context, AppRoutes.home);
    //   } catch (e) {
    //     Navigator.pop(context); // remove loading
    //     showMessage(
    //       context,
    //       content: "Error Register with Google\n$e",
    //       posBtnTitle: "Ok",
    //     );
    //   }
    // },
    backgroundcolor: AppColors.black,
    textColor: AppColors.yellow,
  );

  late LanguageProvider languageProvider;
  // late ThemeProvider themeProvider;

  buildLanguageToggle() => AnimatedToggleSwitch<String>.dual(
    current: LanguageProvider.currentLocale,
    style: ToggleStyle(
      backgroundColor: AppColors.black,
      borderColor: AppColors.yellow,
      indicatorColor: AppColors.yellow,
    ),
    iconBuilder: (language) =>
        Image.asset(language == "ar" ? AppAssets.egIcon : AppAssets.usIcon),
    first: "ar",
    second: "en",

    onChanged: (language) {
      LanguageProvider.changeLanguage(language);
      setState(() {});
    },
  );

  // buildThemeToggle() => AnimatedToggleSwitch<ThemeMode>.dual(
  //   current: themeProvider.mode,
  //   iconBuilder: (mode) =>
  //       Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
  //   first: ThemeMode.light,
  //   second: ThemeMode.dark,
  //   onChanged: (mode) {
  //     themeProvider.changeMode(mode);
  //     setState(() {});
  //   },
  // );
}
