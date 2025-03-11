import 'dart:io';

import 'package:amrtmm_project/app/common/presentation/blocs/bloc/common_screen_bloc.dart';
import 'package:amrtmm_project/core/utils/res/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/enums/status.dart';

class CommonScreen extends StatelessWidget {
  final String title;
  final int screenNum;

  const CommonScreen({super.key, required this.screenNum, required this.title});

  @override
  Widget build(BuildContext context) {
    context
        .read<CommonScreenBloc>()
        .add(FetchScreenDataEvent(screenNum: screenNum));
    return BlocBuilder<CommonScreenBloc, CommonScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                context.pop(context);
              },
            ),
            backgroundColor: AppColors.button,
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Visibility(
            visible:
                state.status == Status.success || state.status == Status.error,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: state.status == Status.error
                ? Text(
                    state.data?.data?.message ?? "Error Here",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(14.0),
                    child: HtmlWidget(state.data?.data?.data.descEn ?? "")),
          ),
        );
      },
    );
  }
}
