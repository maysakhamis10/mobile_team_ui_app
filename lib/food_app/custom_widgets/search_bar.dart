part of 'custom_widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ]),
      child: Center(
        child: TextField(
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: new InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            prefixIcon: Icon(Icons.search, color: Colors.black),
            suffixIcon: Icon(Icons.filter_list, color: Colors.black),
            hintText: kSearch,
            hintStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
