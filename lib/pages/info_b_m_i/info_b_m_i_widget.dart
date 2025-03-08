import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'info_b_m_i_model.dart';
export 'info_b_m_i_model.dart';

class InfoBMIWidget extends StatefulWidget {
  const InfoBMIWidget({super.key});

  static String routeName = 'infoBMI';
  static String routePath = '/infoBMI';

  @override
  State<InfoBMIWidget> createState() => _InfoBMIWidgetState();
}

class _InfoBMIWidgetState extends State<InfoBMIWidget> {
  late InfoBMIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoBMIModel());
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
            'BMI',
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100.0,
                height: MediaQuery.sizeOf(context).height * 0.9,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(7.0, 8.0, 7.0, 0.0),
                      child: Text(
                        'The Body Mass Index, or BMI, is a commonly used tool for assessing a person\'s body weight in relation to their height. It is calculated by dividing the weight in kilograms by the square of the height in meters. The result is a numerical value that is then interpreted based on defined ranges. The typical BMI ranges are as follows:\n\n    Less than 18.5: Underweight\n    Between 18.5 and 24.9: Normal weight\n    Between 25 and 29.9: Overweight\n    Between 30 and 34.9: Class 1 Obesity\n    Between 35 and 39.9: Class 2 Obesity\n    40 or more: Class 3 Obesity (severe obesity)\n\nHowever, it\'s important to note that the BMI has limitations. It doesn\'t take into account factors like fat distribution, muscle mass, or other important health considerations. Therefore, it should not be the sole indicator of health. Additionally, the Waist-to-Height Ratio is often used to assess body fat distribution. To calculate it, measure your waist circumference in centimeters and divide it by your height in centimeters. A ratio above 0.5 is generally considered an indicator of health risk.\n\nIn summary, BMI is a convenient tool for obtaining an initial estimate of body weight in relation to height, but it should be interpreted with caution and used in conjunction with other indicators to gain a more comprehensive understanding of a person\'s health.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
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
