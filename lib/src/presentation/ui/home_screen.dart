import 'package:archonit_test/src/common/enums.dart';
import 'package:archonit_test/src/data/datasource/api_service.dart';
import 'package:archonit_test/src/data/ticker_repository_impl.dart';
import 'package:archonit_test/src/presentation/bloc/ticker_bloc.dart';
import 'package:archonit_test/src/presentation/ui/widgets/ticker_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  late TickerBloc bloc;

  @override
  void initState() {
    final api = ApiService(Dio());
    final repository = TickerRepositoryImpl(api);
    bloc = TickerBloc(repository)..add(const FetchTickersEvent());
    _scrollController = ScrollController();
    _scrollController.addListener(listener);
    super.initState();
  }

  void listener() {
    final maxScroll = _scrollController.position.maxScrollExtent - 1600;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll > maxScroll &&
        bloc.processState == ProcessState.idle &&
        bloc.hasMore) {
      bloc.setProcessState = ProcessState.busy;
      bloc.add(const FetchTickersEvent(more: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 15),
      body: BlocBuilder<TickerBloc, TickerState>(
        bloc: bloc,
        builder: (context, state) {
          return ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: state.tickers.length,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) => TickerItem(
              ticker: state.tickers[index].symbol,
              price: state.tickers[index].priceStr,
            ),
          );
        },
      ),
    );
  }
}
