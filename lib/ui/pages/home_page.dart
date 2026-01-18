import 'package:coffee_inctrementer/controllers/cups_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<CupsCubit>().getCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Coffee Incrementer")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Counter of coffees consumed",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: BlocBuilder<CupsCubit, CupsState>(
              builder: (context, state) {
                final cubit = context.read<CupsCubit>();
                final isDisabled = state.maybeWhen(
                  loading: () => true,
                  incrementing: () => true,
                  orElse: () => false,
                );

                return Column(
                  children: [
                    state.maybeWhen(
                      loading: () => const CircularProgressIndicator(),
                      orElse: () => Text(
                        "${cubit.count} cups",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    state.maybeWhen(
                      incrementing: () => const CircularProgressIndicator(),
                      orElse: () => ElevatedButton(
                        onPressed: isDisabled
                            ? null
                            : () {
                                cubit.increment();
                              },
                        child: const Text("Add Coffee"),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
