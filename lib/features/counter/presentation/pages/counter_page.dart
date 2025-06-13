// Presentation Layer - UI
// UI components are the outermost layer of Clean Architecture.
// They only depend on the presentation layer (BLoC).
// This is where we implement the user interface.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Clean Architecture Example',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildArchitectureLayer(
                      'Domain Layer',
                      'Entities, Use Cases, Repository Interfaces',
                      Colors.blue.shade50,
                    ),
                    const SizedBox(height: 8),
                    _buildArchitectureLayer(
                      'Data Layer',
                      'Models, Data Sources, Repository Implementations',
                      Colors.blue.shade100,
                    ),
                    const SizedBox(height: 8),
                    _buildArchitectureLayer(
                      'Presentation Layer',
                      'BLoC, Events, States, UI',
                      Colors.blue.shade200,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue.shade700,
              ),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CounterLoaded) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${state.counter.value}',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                context.read<CounterBloc>().add(
                                      DecrementCounterEvent(state.counter.value),
                                    );
                              },
                              child: const Icon(Icons.remove),
                            ),
                            const SizedBox(width: 20),
                            FloatingActionButton(
                              onPressed: () {
                                context.read<CounterBloc>().add(
                                      IncrementCounterEvent(state.counter.value),
                                    );
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (state is CounterError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArchitectureLayer(String title, String description, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
} 