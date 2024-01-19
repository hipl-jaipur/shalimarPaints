import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:shalimar/Home_Screen/Teams_Module/teams_screen.dart';
import 'package:shalimar/utils/colors.dart';

class MyTreeTile extends StatelessWidget {
  const MyTreeTile({
    super.key,
    required this.entry,
    required this.onTap,
  });

  final TreeEntry<MyNode> entry;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TreeIndentation(
        entry: entry,
        guide: const IndentGuide.connectingLines(indent: 48),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
          child: Row(
            children: [
              FolderButton(
                isOpen: entry.hasChildren ? entry.isExpanded : null,
                onPressed: entry.hasChildren ? onTap : null,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.node.title,
                      style: TextStyle(color: primaryColor),
                    ),
                    Text("Designation: ${entry.node.designationName}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TreeNode extends StatefulWidget {
  final TreeNodeData data;
  final TreeNodeData parent;
  final State? parentState;

  final bool lazy;
  final Widget icon;
  final bool showCheckBox;
  final bool showActions;
  final bool contentTappable;
  final double offsetLeft;
  final int? maxLines;

  final Function(TreeNodeData node) onTap;
  final void Function(bool checked, TreeNodeData node) onCheck;

  final void Function(TreeNodeData node) onExpand;
  final void Function(TreeNodeData node) onCollapse;

  final Future Function(TreeNodeData node) load;
  final void Function(TreeNodeData node) onLoad;

  final void Function(TreeNodeData node) remove;
  final void Function(TreeNodeData node, TreeNodeData parent) onRemove;

  final void Function(TreeNodeData node) append;
  final void Function(TreeNodeData node, TreeNodeData parent) onAppend;

  const TreeNode({
    Key? key,
    required this.data,
    required this.parent,
    this.parentState,
    required this.offsetLeft,
    this.maxLines,
    required this.showCheckBox,
    required this.showActions,
    required this.contentTappable,
    required this.icon,
    required this.lazy,
    required this.load,
    required this.append,
    required this.remove,
    required this.onTap,
    required this.onCheck,
    required this.onLoad,
    required this.onExpand,
    required this.onAppend,
    required this.onRemove,
    required this.onCollapse,
  }) : super(key: key);

  @override
  _TreeNodeState createState() => _TreeNodeState();
}

class _TreeNodeState extends State<TreeNode> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  bool _isChecked = false;
  bool _showLoading = false;
  late AnimationController _rotationController;
  final Tween<double> _turnsTween = Tween<double>(begin: -0.25, end: 0.0);

  List<TreeNode> _geneTreeNodes(List list) {
    return List.generate(list.length, (int index) {
      return TreeNode(
        data: list[index],
        parent: widget.data,
        parentState: widget.parentState != null ? this : null,
        remove: widget.remove,
        append: widget.append,
        icon: widget.icon,
        lazy: widget.lazy,
        load: widget.load,
        offsetLeft: widget.offsetLeft,
        maxLines: widget.maxLines,
        showCheckBox: widget.showCheckBox,
        showActions: widget.showActions,
        contentTappable: widget.contentTappable,
        onTap: widget.onTap,
        onCheck: widget.onCheck,
        onExpand: widget.onExpand,
        onLoad: widget.onLoad,
        onCollapse: widget.onCollapse,
        onRemove: widget.onRemove,
        onAppend: widget.onAppend,
      );
    });
  }

  @override
  initState() {
    super.initState();
    _isExpanded = widget.data.expanded;
    _isChecked = widget.data.checked;
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onExpand(widget.data);
        } else if (status == AnimationStatus.reverse) {
          widget.onCollapse(widget.data);
        }
      });
    if (_isExpanded) {
      _rotationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.parentState != null) _isChecked = widget.data.checked;

    bool hasData = widget.data.children.isNotEmpty || (widget.lazy && !_isExpanded);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          splashColor: widget.contentTappable ? null : Colors.transparent,
          highlightColor: widget.contentTappable ? null : Colors.transparent,
          mouseCursor: widget.contentTappable ? SystemMouseCursors.click : MouseCursor.defer,
          onTap: widget.contentTappable ? () {
            if (hasData) {
              widget.onTap(widget.data);
              toggleExpansion();
            } else {
              _isChecked = !_isChecked;
              widget.onCheck(_isChecked, widget.data);
              setState(() {});
            }
          } : (){},
          child: Container(
            margin: const EdgeInsets.only(bottom: 2.0),
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RotationTransition(
                  child: IconButton(
                    iconSize: 16,
                    icon: hasData ? widget.icon : Container(),
                    onPressed: hasData ? () {
                      widget.onTap(widget.data);
                      toggleExpansion();
                    } : null,
                  ),
                  turns: _turnsTween.animate(_rotationController),
                ),
                if (widget.showCheckBox)
                  Checkbox(
                    value: _isChecked,
                    checkColor: widget.data.checkBoxCheckColor,
                    fillColor: widget.data.checkBoxFillColor,
                    onChanged: (bool? value) {
                      _isChecked = value!;
                      if (widget.parentState != null) _checkUncheckParent();
                      widget.onCheck(_isChecked, widget.data);
                      setState(() {});
                    },
                  ),
                if (widget.lazy && _showLoading)
                  const SizedBox(
                    width: 12.0,
                    height: 12.0,
                    child: CircularProgressIndicator(strokeWidth: 1.0),
                  ),
                Expanded(
                  child: Container(
                    key: ValueKey(widget.data.backgroundColor?.call()),
                    color: widget.data.backgroundColor?.call(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        widget.data.title,
                        maxLines: widget.maxLines ?? 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                if (widget.showActions)
                  TextButton(
                    onPressed: () {
                      widget.append(widget.data);
                      widget.onAppend(widget.data, widget.parent);
                    },
                    child: const Text('Add', style: TextStyle(fontSize: 12.0)),
                  ),
                if (widget.showActions)
                  TextButton(
                    onPressed: () {
                      widget.remove(widget.data);
                      widget.onRemove(widget.data, widget.parent);
                    },
                    child: const Text('Remove', style: TextStyle(fontSize: 12.0)),
                  ),
                if (widget.data.customActions?.isNotEmpty == true)
                  ...widget.data.customActions!,
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _rotationController,
          child: Padding(
            padding: EdgeInsets.only(left: widget.offsetLeft),
            child: Column(children: _geneTreeNodes(widget.data.children)),
          ),
        )
      ],
    );
  }

  void toggleExpansion() {
    if (widget.lazy && widget.data.children.isEmpty) {
      setState(() {
        _showLoading = true;
      });
      widget.load(widget.data).then((value) {
        if (value) {
          _isExpanded = true;
          _rotationController.forward();
          widget.onLoad(widget.data);
        }
        _showLoading = false;
        setState(() {});
      });
    } else {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _rotationController.forward();
      } else {
        _rotationController.reverse();
      }
      setState(() {});
    }
  }

  void _checkUncheckParent() {
    // Check/uncheck all children based on parent state
    widget.data.checked = _isChecked;
    widget.data.children.forEach((child) => child.checked = _isChecked);
    widget.parentState!.setState(() {});

    // Check/uncheck parent based on children state
    widget.parent.checked = widget.parent.children.every((e) => e.checked);
    widget.parentState!.setState(() {});
  }
}


class TreeNodeData {
  String title;
  bool expanded;
  bool checked;
  dynamic extra;
  final Color? checkBoxCheckColor;
  final MaterialStateProperty<Color>? checkBoxFillColor;
  final ValueGetter<Color>? backgroundColor;
  final List<Widget>? customActions;
  List<TreeNodeData> children;

  TreeNodeData({
    required this.title,
    required this.expanded,
    required this.checked,
    required this.children,
    this.extra,
    this.checkBoxCheckColor,
    this.checkBoxFillColor,
    this.backgroundColor,
    this.customActions,
  });

  TreeNodeData.from(TreeNodeData other):
    this(title: other.title, expanded: other.expanded, checked: other.checked, extra: other.extra, children: other.children);

  @override
  String toString() {
    return 'TreeNodeData{title: $title, expanded: $expanded, checked: $checked, extra: $extra, ${children.length} children}';
  }
}
class TreeView extends StatefulWidget {
  final List<TreeNodeData> data;

  final bool lazy;
  final Widget icon;
  final double offsetLeft;
  final int? maxLines;
  final bool showFilter;
  final String filterPlaceholder;
  final bool showActions;
  final bool showCheckBox;
  final bool contentTappable;

  /// Desired behavior:
  /// - if I check/uncheck a parent I want all children to be checked/unchecked
  /// - if I check/uncheck all children I want the parent to be checked/unchecked
  final bool manageParentState;

  final Function(TreeNodeData node)? onTap;
  final void Function(TreeNodeData node)? onLoad;
  final void Function(TreeNodeData node)? onExpand;
  final void Function(TreeNodeData node)? onCollapse;
  final void Function(bool checked, TreeNodeData node)? onCheck;
  final void Function(TreeNodeData node, TreeNodeData parent)? onAppend;
  final void Function(TreeNodeData node, TreeNodeData parent)? onRemove;

  final TreeNodeData Function(TreeNodeData parent)? append;
  final Future<List<TreeNodeData>> Function(TreeNodeData parent)? load;

  const TreeView({
    Key? key,
    required this.data,
    this.onTap,
    this.onCheck,
    this.onLoad,
    this.onExpand,
    this.onCollapse,
    this.onAppend,
    this.onRemove,
    this.append,
    this.load,
    this.lazy = false,
    this.offsetLeft = 24.0,
    this.maxLines,
    this.showFilter = false,
    this.filterPlaceholder = 'Search',
    this.showActions = false,
    this.showCheckBox = false,
    this.contentTappable = false,
    this.icon = const Icon(Icons.expand_more, size: 16.0),
    this.manageParentState = false,
  }) : super(key: key);

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  late TreeNodeData _root;
  List<TreeNodeData> _renderList = [];

  List<TreeNodeData> _filter(String val, List<TreeNodeData> list) {
    List<TreeNodeData> tempNodes = [];

    for (int i = 0; i < list.length; i++) {
      TreeNodeData tempNode = TreeNodeData.from(list[i]);

      if (tempNode.children.isNotEmpty) {
        tempNode.children = _filter(val, tempNode.children);
      }

      if (tempNode.title.contains(RegExp(val, caseSensitive: false)) || tempNode.children.isNotEmpty) {
        tempNodes.add(tempNode);
      }
    }

    return tempNodes;
  }

  void _onChange(String val) {
     _renderList = widget.data;

    if (val.isNotEmpty) {
      _renderList = _filter(val, _renderList);
    }

    setState(() {});
  }

  void append(TreeNodeData parent) {
    parent.children.add(widget.append!(parent));
    setState(() {});
  }

  void _remove(TreeNodeData node, List<TreeNodeData> list) {
    for (int i = 0; i < list.length; i++) {
      if (node == list[i]) {
        list.removeAt(i);
      } else {
        _remove(node, list[i].children);
      }
    }
  }

  void remove(TreeNodeData node) {
    _remove(node, _renderList);
    setState(() {});
  }

  Future<bool> load(TreeNodeData node) async {
    try {
      final data = await widget.load!(node);
      node.children = data;
      setState(() {});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _renderList = widget.data;
    _root = TreeNodeData(
      title: '',
      extra: null,
      checked: false,
      expanded: false,
      children: _renderList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.showFilter)
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                right: 18.0,
                bottom: 12.0,
              ),
              child: TextField(
                onChanged: _onChange,
                 decoration: InputDecoration(
                  labelText: widget.filterPlaceholder,
                )
              ),
            ),
          ...List.generate(
            _renderList.length,
            (int index) {
              return TreeNode(
                load: load,
                remove: remove,
                append: append,
                parent: _root,
                parentState: widget.manageParentState ? this : null,
                data: _renderList[index],
                icon: widget.icon,
                lazy: widget.lazy,
                offsetLeft: widget.offsetLeft,
                maxLines: widget.maxLines,
                showCheckBox: widget.showCheckBox,
                showActions: widget.showActions,
                contentTappable: widget.contentTappable,
                onTap: widget.onTap ?? (n) {},
                onLoad: widget.onLoad ?? (n) {},
                onCheck: widget.onCheck ?? (b, n) {},
                onExpand: widget.onExpand ?? (n) {},
                onRemove: widget.onRemove ?? (n, p) {},
                onAppend: widget.onAppend ?? (n, p) {},
                onCollapse: widget.onCollapse ?? (n) {},
              );
            },
          )
        ],
      ),
    );
  }
}