import 'package:admin/Features/Academic/Staff/Teachers/Provider/indexProvider.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Provider/pageLoadingProvider.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Service/Read/readTeacher.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Widget/customHeader.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Widget/employeeContainer.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Widget/profileContainer.dart';
import 'package:admin/Home/Provider/onHoverProvider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Manageteachers extends ConsumerStatefulWidget {
  const Manageteachers({super.key});

  @override
  ConsumerState<Manageteachers> createState() {
    return _ManageTeacherList();
  }
}

class _ManageTeacherList extends ConsumerState<Manageteachers> {
  var list;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    ref.read(isPageLoadingProvider.notifier).state = false;
    await Future.delayed(Duration(seconds: 5));
    var res = await readTeacherService();
    list = res;
    print('the list is : $list');
    print(list[0]['name']);
    ref.read(isPageLoadingProvider.notifier).state = true;
  }

  @override
  Widget build(BuildContext context) {
    final isLoadingData = ref.watch(isPageLoadingProvider);
    final indexprovider = ref.watch(indexProvider);

    return Scaffold(
      body:
          isLoadingData
              ? Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: double.maxFinite,
                    child: CustomHeader(
                      totalClassTeachers: "20",
                      totalSubjectTeachers: "30",
                      totalTeachers: "50",
                      mcontex: context,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                            child: GridView.builder(
                              itemCount: 8,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 50,
                                    childAspectRatio: 2 / 3,
                                  ),
                              itemBuilder: (context, index) {
                                return MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  onEnter: (_) {
                                    ref
                                        .read(onHoverProvider(index).notifier)
                                        .state = true;
                                  },
                                  onExit: (_) {
                                    ref
                                        .read(onHoverProvider(index).notifier)
                                        .state = false;
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      ref.read(indexProvider.notifier).state =
                                          index;
                                    },
                                    child: EmployeeContainer(
                                      index: index,
                                      name: list[index]['name'],
                                      subject: list[index]['subject'],
                                      qualification:
                                          list[index]['qualification'],
                                      email: list[index]['email'],
                                      phone: list[index]['contact'],
                                      classteacher: list[index]['classTeacher'],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                          width: 400,
                          height: double.maxFinite,
                          child: Profilecontainer(
                            index: indexprovider,
                            name: list[indexprovider]['name'],
                            subject: list[indexprovider]['subject'],
                            qualification: list[indexprovider]['qualification'],
                            email: list[indexprovider]['email'],
                            phone: list[indexprovider]['contact'],
                            parents: list[indexprovider]['parent'],
                            gender: list[indexprovider]['Gender'],
                            dob: list[indexprovider]['DOB'],
                            joining_date: list[indexprovider]['joining_date'],
                            experience: list[indexprovider]['experience'],
                            wich_class: list[indexprovider]['wich_class'],
                            address: list[indexprovider]['address'],
                            password: list[indexprovider]['password'],
                            classteacher: list[indexprovider]['classTeacher'],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
