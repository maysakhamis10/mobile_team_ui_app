part of 'custom_widgets.dart';

AppBar buildFoodAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        }),
    centerTitle: true,
    title: Text(
      title,
    ),
  );
}
