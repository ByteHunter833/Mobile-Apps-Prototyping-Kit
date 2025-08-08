import 'package:flutter/material.dart';

class ConfirmationCode extends StatefulWidget {
  const ConfirmationCode({super.key});

  @override
  State<ConfirmationCode> createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<ConfirmationCode> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 88, left: 24, right: 24),
          child: Column(
            children: [
              const Text(
                'Enter confirmation code',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Text(
                textAlign: TextAlign.center,
                'A 4-digit code was sent to \n lucasscott3@email.com',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Colors.blue))),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index + 1]);
                        }
                        // Если удалили, перейти к предыдущему
                        else if (value.isEmpty && index > 0) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index - 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 24,
              ),
              TextButton.icon(
                style: const ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size.fromHeight(48))),
                onPressed: () {},
                label: const Text('Resend Code',
                    style: TextStyle(color: Colors.blue)),
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    minimumSize:
                        const WidgetStatePropertyAll(Size.fromHeight(48)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                    backgroundColor: const WidgetStatePropertyAll(Colors.blue)),
                child: const Text('Continue'),
              )
            ],
          ),
        ),
      )),
    );
  }
}
