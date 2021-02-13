import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatefulWidget {
  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  List data = [
    {'number': '', 'Item': '', 'Qty': ''},
    30,
    40
  ];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();

  Widget commentChild() {
    print(data);
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  child: Image.network(
                      "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400"),
                ),
              ),
              title: Text(
                "Adeleye Ayodeji",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("3start"),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comment Box")),
      body: Column(
        children: [
          Expanded(child: commentChild()),
          Divider(),
          ListTile(
            title: Form(
              key: _formKey,
              child: TextFormField(
                controller: _commentController,
                decoration: InputDecoration(labelText: 'Write a review...'),
                validator: (value) =>
                    value.isEmpty ? 'Write cannot be blank' : null,
              ),
            ),
            trailing: OutlineButton(
              highlightedBorderColor: Colors.orange,
              onPressed: () {
                // addComment(_commentController.text);
                if (_formKey.currentState.validate()) {
                  FocusScope.of(context).unfocus();
                }
              },
              borderSide: BorderSide.none,
              child: Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
