import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../widgets/auth_button.dart';

class ProfileMobileScreen extends StatelessWidget {
  const ProfileMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Information'),
        leading: IconButton(
          onPressed: () {
            Nav.to(context, '/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          const DayNightSwitch(),
          ActionButtons(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: ListView(
            children: [
              CATextInputField(
                prefixIcon: Icons.edit,
                labelTextStr: 'Input Your Name',
              ),
              CATextInputField(
                prefixIcon: Icons.edit,
                labelTextStr: 'Input Your Mobile Number',
              ),
              CATextInputField(
                prefixIcon: Icons.edit,
                labelTextStr: 'Input Your Address',
              ),
              CATextInputField(
                prefixIcon: Icons.edit,
                labelTextStr: 'Input Your Country',
              ),
              CATextInputField(
                prefixIcon: Icons.edit,
                labelTextStr: 'Input Your Pincode',
              ),
              const Divider(
                height: 20,
                thickness: 2,
              ),
              const Text(
                'Login Information',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              CATextInputField(
                prefixIcon: Icons.edit,
                labelTextStr: 'Input Your Email',
              ),
              CATextInputField(
                prefixIcon: Icons.edit,
                labelTextStr: 'Input Your New Password',
                obscureText: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                ),
              ),
              CATextInputField(
                prefixIcon: Icons.edit,
                labelTextStr: 'Input Your Confirm Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 8,
              ),
              AuthButton(
                label: 'Save Now',
                onPressed: () {},
                paddingValue: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
