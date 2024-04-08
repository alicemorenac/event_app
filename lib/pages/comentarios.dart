import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:event_app/controllers/controller_comentarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Comentarios extends StatelessWidget {
  const Comentarios({super.key});

  @override
  Widget build(BuildContext context) {
    final comentarios = Provider.of<ControllerComentarios>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Observer(
            builder: (_) {
              return CommentTreeWidget<Comment, Comment>(
                Comment(
                  avatar: 'null',
                  userName: 'José da silva',
                  content: 'Esse app de eventos é o melhor!!!',
                ),
                [
                  for (var cc in comentarios.comentarios)
                    Comment(
                      avatar: cc.avatart,
                      userName: cc.userName,
                      content: cc.content,
                    ),
                ],
                treeThemeData: TreeThemeData(lineColor: Colors.green[500]!, lineWidth: 3),
                avatarRoot: (context, data) => const PreferredSize(
                  preferredSize: Size.fromRadius(18),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('assets/evento.png'),
                  ),
                ),
                avatarChild: (context, data) => const PreferredSize(
                  preferredSize: Size.fromRadius(12),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('assets/evento.png'),
                  ),
                ),
                contentChild: (context, data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.userName}',
                              style: Theme.of(context).textTheme.caption?.copyWith(
                                  fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${data.content}',
                              style: Theme.of(context).textTheme.caption?.copyWith(
                                  fontWeight: FontWeight.w300, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.grey[700], fontWeight: FontWeight.bold),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              Text('Like'),
                              SizedBox(
                                width: 24,
                              ),
                              Text('Reply'),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                contentRoot: (context, data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.userName}',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${data.content}',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.w300, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.grey[700], fontWeight: FontWeight.bold),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              Text('Like'),
                              SizedBox(
                                width: 24,
                              ),
                              Text('Reply'),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
