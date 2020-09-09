import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izy_shop/app/core/configs/core_config.dart';
import 'package:izy_shop/app/core/consts/img.dart';
import 'package:izy_shop/app/modules/auth/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  final _authCtrllr = Modular.get<AuthController>();

  final Widget _popButton = InkWell(
    borderRadius: BorderRadius.circular(40.0),
    onTap: () => Modular.to.pop(),
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(40.0)),
      child: Icon(Icons.close),
    ),
  );

  final Text _getStart = Text(
    'Vamos Começar!',
    overflow: TextOverflow.visible,
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );

  final Text _loginWithSocialNetwork = Text(
    'Entrar com redes sociais ou digite seus dados',
    overflow: TextOverflow.visible,
    style: TextStyle(
      fontSize: 14,
      color: Colors.black54,
    ),
  );

  Widget _buildCustomIconButton(String img, {VoidCallback onTap}) {
    return LayoutBuilder(
      builder: (_, constraints) => InkWell(
        borderRadius: BorderRadius.circular(60),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              border: Border.all(width: 0.5, color: Colors.black26)),
          child: Container(
              padding: EdgeInsets.all(15.0), child: SvgPicture.asset(img)),
        ),
        onTap: onTap,
      ),
    );
  }

  TextFormField _buildTextFormField(
    TextEditingController controller,
    String labelText,
    String preffixIcon,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black26, fontSize: 16),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.black26)),
        prefixIcon: Container(
            padding: EdgeInsets.all(12.0),
            child: SvgPicture.asset(preffixIcon)),
      ),
    );
  }

  Widget _checkTerm() {
    bool checked = true;
    return Checkbox(
      value: checked,
      onChanged: (value) {
        checked = !checked;
      },
    );
  }

  final RichText _term = RichText(
      overflow: TextOverflow.visible,
      text: TextSpan(children: [
        TextSpan(
          text: 'Ao se registar você concorda com os nossos',
          style: TextStyle(color: Colors.black38),
        ),
        TextSpan(
          text: ' Termos de Serviço ',
          style: TextStyle(color: Colors.black87),
        ),
        TextSpan(
          text: 'e',
          style: TextStyle(color: Colors.black38),
        ),
        TextSpan(
          text: ' Política de Privaidade',
          style: TextStyle(color: Colors.black87),
        ),
      ]));

  Widget _buildTermsAcceptance() {
    return Row(
      children: [_checkTerm(), Expanded(child: _term)],
    );
  }

  Widget _buildSignupButton(
    BuildContext context, {
    VoidCallback onPressed,
  }) {
    return Container(
      height: 60,
      width: getWidth(context) * 0.45,
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
        color: Colors.white,
        elevation: 6.0,
        onPressed: onPressed,
        child: Text(
          'Registar',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildContentContainer(BuildContext context) {
    return Container(
      width: getWidth(context),
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _popButton,
          SizedBox(height: 30),
          _getStart,
          SizedBox(height: 10),
          _loginWithSocialNetwork,
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCustomIconButton(TWITTER_ICON, onTap: () {}),
              SizedBox(width: 30),
              _buildCustomIconButton(FB_ICON, onTap: () {}),
            ],
          ),
          Divider(thickness: 2.0),
          SizedBox(height: 30),
          _buildTextFormField(_authCtrllr.nameCtrllr, 'Nome', USER_ICON),
          _buildTextFormField(_authCtrllr.emailCtrllr, 'Email', MAIL_ICON),
          _buildTextFormField(_authCtrllr.passwordCtrllr, 'Senha', LOCK_ICON),
          SizedBox(height: 40),
          _buildTermsAcceptance(),
          SizedBox(height: 40),
          Center(
            child: _buildSignupButton(
              context,
              onPressed: () =>
                  Modular.to.pushNamedAndRemoveUntil('/', (_) => false),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SingleChildScrollView(child: _buildContentContainer(context)),
    );
  }
}
