import 'package:cubtale/core/init/extension/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({super.key, required this.title, required this.searchType});
  final String title;
  final String searchType;

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 15,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black)),
          const SizedBox(
            height: 5,
          ),
          Text(widget.searchType,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black)),
          Row(
            children: [
              TextField(
                onChanged: (value) {},
                obscureText: true,
                decoration: _inputDecoration(context),
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: context.appTheme.colors.backgroundColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Text("Search",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

InputDecoration _inputDecoration(BuildContext context) {
  return InputDecoration(
    filled: true,
    fillColor: context.appTheme.colors.backgroundColor,
    border: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.appTheme.colors.backgroundColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: context.appTheme.colors.backgroundColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15))),
  );
}
