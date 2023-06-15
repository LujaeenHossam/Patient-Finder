import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/student/studentcubit/cubit.dart';
import '../../../layout/student/studentcubit/states.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../post_screen.dart';

class fullMouthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<studentLayoutcubit, studentLayoutstates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
           condition:  studentLayoutcubit.get(context).fullMouthCases.length >0,
          builder: (context) => Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: 'Full Mouth Rehabilitation',
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => studentDefaultbuildPost(
                    studentLayoutcubit.get(context).fullMouthCases[index],
                    context,
                    studentPostScreen(),
                    studentLayoutcubit.get(context),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.0,
                  ),
                  itemCount:
                      studentLayoutcubit.get(context).fullMouthCases.length,
                ),
                SizedBox(
                  height: 8.0,
                ),
              ]),
            ),
          ),
          fallback: (context) => Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: 'Full Mouth Rehabilitation',
            ),
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('images/nodataavailable.gif'),
                    //  width: 250,
                    //    height: 250,
                  ),
                  Text(
                    'Sorry We Can\'t Find Any Data ',
                    style: TextStyle(
                      fontSize: 20,
                      color: defaultcol,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
