// ignore_for_file: unused_field, must_call_super
import 'package:flutter/material.dart';
import 'package:yemen_gallary/errors/controller/base_controller.dart';

class LoadingPageAnimation extends StatefulWidget {
  const LoadingPageAnimation({Key? key}) : super(key: key);
  @override
  _LoadingPageAnimationState createState() => _LoadingPageAnimationState();
}

class _LoadingPageAnimationState extends State<LoadingPageAnimation>
    with BaseController {
  late bool _isLoading;
  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NewCardLoading(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.04),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
          ),
          const SizedBox(height: 32),
          _isLoading
              ? const Center(
                  child: NewCardLoading(),
                )
              : Container(),
        ],
      ),
    );
  }
}

class NewCardLoading extends StatelessWidget {
  const NewCardLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Skelton(
          height: 120,
          width: 120,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skelton(width: 80),
              const SizedBox(height: 8),
              const Skelton(),
              const SizedBox(height: 8),
              const Skelton(),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Expanded(child: Skelton()),
                  SizedBox(width: 16),
                  Expanded(child: Skelton()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
