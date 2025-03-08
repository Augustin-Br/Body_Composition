import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'rules_model.dart';
export 'rules_model.dart';

class RulesWidget extends StatefulWidget {
  const RulesWidget({super.key});

  static String routeName = 'rules';
  static String routePath = '/rules';

  @override
  State<RulesWidget> createState() => _RulesWidgetState();
}

class _RulesWidgetState extends State<RulesWidget> {
  late RulesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RulesModel());
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
            'Confidentiality',
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 1250.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: Text(
                        'Privacy Policy\n\nLast Updated: 11/09/2023\n\nThis Privacy Policy explains how BodyComposition collects, uses, and shares information about your use of our Android mobile application. Your use of the application signifies your acceptance of the practices described in this Privacy Policy.\n\n  1.  Data Collection\n\nWe do not collect any personally identifiable information from our users, such as names, addresses, or contact information. Our application does not access any information on your device, except for data strictly necessary to execute the application\'s functionalities.\n\n  2.  Google AdMob Advertising\n\nOur application uses the Google AdMob advertising service to display ads. AdMob may collect user data to display personalized ads. Please refer to the Google AdMob Privacy Policy for more information on data collection and usage by AdMob.\n\n  3.  Cookies\n\nWe do not use cookies or similar technologies to collect information.\n\n  4.  Data Sharing\n\nWe do not share personal data with third parties, except for Google AdMob as described above.\n\n  5.  Security\n\nWe implement security measures to protect the data collected by the application, following industry best practices.\n\n  6.  Your Rights\n\nIn accordance with data protection laws, you have the right to request access to your personal data, rectify it, delete it, or object to its processing. To exercise these rights or ask questions about our Privacy Policy, please contact us at bodycompositiondev@gmail.com.\n\n  7.  Changes to Privacy Policy\n\nWe reserve the right to update or modify our Privacy Policy at any time. Any changes will be displayed within the application and will take effect upon publication.\n\n  8.  Acceptance of Privacy Policy\n\nBy using our application, you accept this Privacy Policy. If you do not agree with this Privacy Policy, please discontinue the use of the application.\n\nFor any questions or concerns regarding this Privacy Policy, please contact us at bodycompositiondev@gmail.com.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
