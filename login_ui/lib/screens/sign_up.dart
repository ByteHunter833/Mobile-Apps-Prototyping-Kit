import 'package:flutter/material.dart';
import 'package:login_ui/screens/confirmation_code.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool visibility = true;
  bool checkboxValue = false;
  void onChanged(bool? newValue) {
    setState(() {
      checkboxValue = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Create an account to get started ',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 24,
              ),

              ///Name
              const Text(
                'Name',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 9,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                'Email Address',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 9,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'name@email.com',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                'Password',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 9,
              ),
              TextField(
                obscureText: visibility,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                        icon: visibility
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),

              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: visibility,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                        icon: visibility
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    hintText: 'Confirm a password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkboxValue,
                    onChanged: onChanged,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    activeColor: Colors.blue,
                  ),
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.grey),
                          text: "I've read and agree with the ",
                          children: [
                        TextSpan(
                            text: 'Terms and \n Conditions ',
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(text: 'and the '),
                        TextSpan(
                            text: 'Privacy Policy.',
                            style: TextStyle(color: Colors.blue))
                      ]))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const ConfirmationCode(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        final tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        final offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size.fromHeight(48)),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                child: const Text('Continue'),
              )
            ],
          ),
        )),
      ),
    );
  }
}
