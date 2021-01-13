import 'package:flutter/material.dart';
import 'package:vgv_flutter_cookbook/app.dart';
import 'package:vgv_flutter_cookbook/items.dart';

void main() {
  runApp(App());
}

@immutable
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void _navigate(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(MaterialPageRoute(builder: builder));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Cookbook'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return ListTile(
            onTap: item.builder == null ? null : () => _navigate(context, item.builder!),
            leading: UnconstrainedBox(
              constrainedAxis: Axis.vertical,
              child: Icon(
                (item.recommendation == Recommendation.yes)
                    ? const IconData(0x2705)
                    : (item.recommendation == Recommendation.maybe
                        ? const IconData(0x2734)
                        : const IconData(0x26D4)),
              ),
            ),
            title: Text(item.name),
            subtitle: Text(item.type),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          );
        },
      ),
    );
  }
}
