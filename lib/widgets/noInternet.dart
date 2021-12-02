import 'package:booking_theater/style/theme.dart';
import 'package:flutter/material.dart';

class NoInternetWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColor.loginGradientEnd.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/no_internet_gif.gif',
              fit: BoxFit.cover,
            ),
            Text('No Internet Connection',
              style: AppTextStyles.error(context),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Please turn on your Internet',
                style: AppTextStyles.help(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
