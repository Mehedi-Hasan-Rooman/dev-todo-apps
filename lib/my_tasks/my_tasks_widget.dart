import '../backend/backend.dart';
import '../create_task_page/create_task_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../task_details/task_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTasksWidget extends StatefulWidget {
  const MyTasksWidget({Key key}) : super(key: key);

  @override
  _MyTasksWidgetState createState() => _MyTasksWidgetState();
}

class _MyTasksWidgetState extends State<MyTasksWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1F24),
        automaticallyImplyLeading: false,
        title: Text(
          'My Tasks',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF1A1F24),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 48,
          fillColor: Colors.black,
          icon: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.of(context).white,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                duration: Duration(milliseconds: 800),
                reverseDuration: Duration(milliseconds: 800),
                child: CreateTaskPageWidget(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Scheduled Tasks',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<ToDoListRecord>>(
                          stream: queryToDoListRecord(
                            queryBuilder: (toDoListRecord) => toDoListRecord
                                .orderBy('toDoDate', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: SpinKitFoldingCube(
                                    color: Color(0xFFFF2828),
                                    size: 80,
                                  ),
                                ),
                              );
                            }
                            List<ToDoListRecord> columnToDoListRecordList =
                                snapshot.data;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    columnToDoListRecordList.length,
                                    (columnIndex) {
                                  final columnToDoListRecord =
                                      columnToDoListRecordList[columnIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.bottomToTop,
                                            duration:
                                                Duration(milliseconds: 1000),
                                            reverseDuration:
                                                Duration(milliseconds: 1000),
                                            child: TaskDetailsWidget(
                                              toDoNote: columnToDoListRecord
                                                  .reference,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBlack,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        columnToDoListRecord
                                                            .toDoName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'MMMEd',
                                                              columnToDoListRecord
                                                                  .toDoDate),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 12, 0),
                                                    child: ToggleIcon(
                                                      onPressed: () async {
                                                        final toDoListUpdateData =
                                                            createToDoListRecordData(
                                                          toDoState:
                                                              !columnToDoListRecord
                                                                  .toDoState,
                                                        );
                                                        await columnToDoListRecord
                                                            .reference
                                                            .update(
                                                                toDoListUpdateData);
                                                      },
                                                      value:
                                                          columnToDoListRecord
                                                              .toDoState,
                                                      onIcon: Icon(
                                                        Icons.check_circle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 25,
                                                      ),
                                                      offIcon: Icon(
                                                        Icons.radio_button_off,
                                                        color:
                                                            Color(0xFF2B343A),
                                                        size: 25,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
