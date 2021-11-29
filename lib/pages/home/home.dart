import 'package:drive/models/user.dart';
import 'package:drive/pages/auth/auth_page.dart';
import 'package:drive/pages/map/map_view.dart';
import 'package:drive/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.grey[200],
        child: ValueListenableBuilder<User?>(
          valueListenable: UserRepository.instance!.userNotifier,
          builder: (context, value, child) {
            if (value != null) {
              return Builder(
                builder: (context) {
                  if (!value.isVerified!) {
                    return AuthPageWidget(page: 2, uid: value.uid);
                  } else {
                    return MapViewWidget();
                  }
                },
              );
            } else {
              return AuthPageWidget(page: 0);
            }
          },
        ),
      ),
    );
  }
}
