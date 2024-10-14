import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/app_constants.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/styles.dart';
import '../../../shared/utils/validator.dart';
import '../../widgets/bg_login.dart';
import '../widgets/button_login_widget.dart';
import '../widgets/textfield_login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController codePhoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    try {
      if (formKey.currentState!.validate()) {
        bool success = true;
        if (success) {
          showSnackBar(context, "Đăng nhập thành công");
          context.go('/home'); // Navigate to the home page
        } else {
          showSnackBar(context, "Số điện thoại hoặc mã cá nhân không đúng");
        }
      }
    } catch (e) {
      showSnackBar(context, 'Đăng nhập thất bại');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const BgLogin(),
            _buildBgOpacity(),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBgOpacity() {
    return Container(
      color: Colors.white.withOpacity(0.7),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40),
            child: SvgPicture.asset(
              'assets/images/login/logo_tdmu.svg',
              color: primaryBlue,
            ),
          ),
          SizedBox(height: getHeight(context) * 0.03),
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            alignment: Alignment.bottomCenter,
            child: const Text(
              'SMART G-HOUSE',
              style: TextStyle(
                  fontFamily: 'sf_compact',
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: textSecondary),
            ),
          ),
          _buildFormLogin(context),
        ],
      ),
    );
  }

  Widget _buildFormLogin(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        width: getWidth(context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.05),
        child: Column(
          children: [
            SizedBox(height: getHeight(context) * 0.05),
            Text(
              'ĐĂNG NHẬP',
              style: styleS24W4(primaryBlue).copyWith(
                  fontFamily: 'sf_compact', fontWeight: FontWeight.w200),
            ),
            SizedBox(height: getHeight(context) * 0.03),
            TextfieldLoginWidget(
              validator: Validator.validatePhoneNumber,
              controller: phoneNumberController,
              lable: 'Số điện thoại',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: getHeight(context) * 0.025),
            TextfieldLoginWidget(
              validator: Validator.validateCodePhone,
              controller: codePhoneController,
              suffixIcon: true,
              lable: 'Mật khẩu',
              textInputAction: TextInputAction.done,
              obscure: true,
            ),
            SizedBox(height: getHeight(context) * 0.02),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Quên mã cá nhân?',
                      style: styleS12W5(textPrimary),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: getHeight(context) * 0.02),
            ButtonLoginWidget(
              title: 'Đăng nhập',
              onPressed: () async {
                login();
              },
            ),
            SizedBox(height: getHeight(context) * 0.02),
            TextButton(
              onPressed: () async {},
              child: Text('Đăng nhập nhanh bằng email'),
            ),
            TextButton(
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  text: 'Bạn không có tài khoản? ',
                  style: styleS14W4(textPrimary),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Đăng ký ngay',
                      style: styleS14W6(primaryBlue),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getHeight(context) * 0.01),
          ],
        ),
      ),
    );
  }
}
