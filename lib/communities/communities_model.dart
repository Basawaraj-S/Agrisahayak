import '/flutter_flow/flutter_flow_util.dart';
import 'communities_widget.dart' show CommunitiesWidget;
import 'package:flutter/material.dart';

class CommunitiesModel extends FlutterFlowModel<CommunitiesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
