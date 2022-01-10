import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:starwarsbitsports/generated/l10n.dart';
import 'package:starwarsbitsports/pages/bloc/bloc.dart' as bloc;
import 'package:starwarsbitsports/widgets/item_books.dart';

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc.Bloc()
        ..add(
          bloc.LoadStatusEvent(),
        ),
      child: BlocListener<bloc.Bloc, bloc.State>(
        listener: (context, state) {},
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(S.current.NameAuthor, textAlign: TextAlign.center),
              ),
              backgroundColor: const Color(0xff000000),
            ),
            body: const SingleChildScrollView(
              child: _Body(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<bloc.Bloc, bloc.State>(builder: (context, state) {
      if (state is bloc.LoadingState) {
        return const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is bloc.ErrorState) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: Text(
              S.current.FailedToLoadData,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
      return Column(
        children: <Widget>[
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.model.listbooks.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Modular.to.pushNamed('/detail', arguments: {
                  'doc': state.model.listbooks[index],
                });
              },
              child: ItemBooks(
                item: state.model.listbooks[index],
              ),
            ),
          )
        ],
      );
    });
  }
}
