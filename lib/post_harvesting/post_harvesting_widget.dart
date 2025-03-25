import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'post_harvesting_model.dart';
export 'post_harvesting_model.dart';

class PostHarvestingWidget extends StatefulWidget {
  const PostHarvestingWidget({super.key});

  static String routeName = 'PostHarvesting';
  static String routePath = '/postHarvesting';

  @override
  State<PostHarvestingWidget> createState() => _PostHarvestingWidgetState();
}

class _PostHarvestingWidgetState extends State<PostHarvestingWidget> {
  late PostHarvestingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostHarvestingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
