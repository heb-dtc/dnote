import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final T model;

  final Widget Function(BuildContext context, T value, Widget child) builder;

  final Function(T) onModelReady;

  BaseView({this.builder, this.model, this.onModelReady});

  @override
  State<StatefulWidget> createState() {
    return _BaseViewState<T>(this.model);
  }
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  final T model;

  _BaseViewState(this.model);

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
