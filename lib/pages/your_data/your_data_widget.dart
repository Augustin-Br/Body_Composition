import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'your_data_model.dart';
export 'your_data_model.dart';

class YourDataWidget extends StatefulWidget {
  const YourDataWidget({super.key});

  static String routeName = 'YourData';
  static String routePath = '/yourData';

  @override
  State<YourDataWidget> createState() => _YourDataWidgetState();
}

class _YourDataWidgetState extends State<YourDataWidget> {
  late YourDataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourDataModel());
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Your data',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.89,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                  child: Text(
                    'Your Privacy is Our Priority\n\nWe understand the importance of the privacy of your personal data. That\'s why we want to assure you that our application does not collect any of your personal information, and all the data you enter remains securely on your own device. Here\'s how we ensure your privacy:\n\n1. Zero Data Collection : Our application does not collect any personal information, be it your name, age, or any other personal data. You remain completely anonymous.\n\n2. Local and Secure Storage : All the data you enter into our application is stored locally on your device. We do not have access to this data, and it never leaves your device.\n\n3. Robust Encryption : Your data is secured with strong encryption, which means it is unreadable to anyone or any entity external to your device.\n\n4. No External Server : Our application does not connect to any external server. None of your data is transferred to a remote server. Everything stays between you and your device.\n\nWe firmly believe in protecting your privacy. Our goal is to provide you with tools to help you achieve your goals while ensuring that your data remains strictly confidential.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
