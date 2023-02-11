import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anakmuslimapp/presentation/blocs/bloc/anakmuslim_bloc.dart';
import 'package:anakmuslimapp/presentation/widgets/anakmuslim_card_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<AnakMuslimBloc, AnakMuslimState>(
                  builder: (context, state) {
                    if (state is AnakMuslimFetchedState) {
                      return GridView.count(
                        scrollDirection: Axis.vertical,
                        childAspectRatio:
                            (MediaQuery.of(context).size.height / 2) /
                                (MediaQuery.of(context).size.width / 2 * 2),
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: state.listAnakMuslim
                            .map((anakmuslim) =>
                                AnakMuslimCardWidget(anakmuslim: anakmuslim))
                            .toList(),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
