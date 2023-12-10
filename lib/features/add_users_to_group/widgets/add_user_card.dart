import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:flutter/material.dart';

class AddUserCard extends StatefulWidget {
  const AddUserCard({
    super.key,
    required this.userModel,
    required this.selectedUsers,
    this.margin = const EdgeInsets.all(2),
    this.onTap,
    required this.index,
  });

  final int index;
  final UserListModel userModel;
  final List<Map<UserListModel, bool>> selectedUsers;
  final EdgeInsets? margin;
  final Function()? onTap;

  @override
  State<AddUserCard> createState() => _AddUserCardState();
}

class _AddUserCardState extends State<AddUserCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      margin: widget.margin,
      child: InkWell(
        onTap: widget.onTap,
        child: ListTile(
          leading: CircleAvatar(
            child: widget.userModel.avatar != null
                ? Text(widget.userModel.avatar!)
                : const Icon(Icons.person),
          ),
          title: Text(
            widget.userModel.displayName ?? widget.userModel.email,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            widget.userModel.isOnline
                ? S.of(context).online
                : S.of(context).wasRecently,
            maxLines: 1,
          ),
          trailing: widget.selectedUsers[widget.index][widget.userModel] == true
              ? Icon(
                  Icons.check_circle,
                  size: 30,
                  color: theme.primaryColor,
                )
              : const Icon(
                  Icons.check_circle_outline,
                  size: 30,
                  color: Colors.grey,
                ),
          onTap: () {
            setState(() {
              widget.selectedUsers[widget.index][widget.userModel] =
                  !widget.selectedUsers[widget.index][widget.userModel]!;
              widget.selectedUsers[widget.index] = {
                widget.userModel: widget.selectedUsers[widget.index]
                    [widget.userModel]!
              };
            });
          },
        ),
      ),
    );
  }
}
