import 'package:amrtmm_project/app/service/offers.dart';
import 'package:amrtmm_project/app/service/presentation/blocs/my_services_bloc/my_service_bloc.dart';
import 'package:amrtmm_project/app/service/presentation/widgets/quotation_list_item.dart';
import 'package:amrtmm_project/app/service/presentation/widgets/service_list_item.dart';
import 'package:amrtmm_project/app/service/updateQuotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/res/appColors.dart';
import '../../core/utils/res/components/buildButtonCard.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  // Color myServicesButtonColor = AppColors.button;
  // Color quotationsButtonColor = Colors.grey;
  // Color myRequestsButtonColor = Colors.grey;
  // int selectedCardIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyServiceBloc, MyServiceState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<MyServiceBloc>()
                              .add(const ChangeTabEvent(index: 0));
                          // setState(() {
                          //   myServicesButtonColor = AppColors.button;
                          //   quotationsButtonColor = const Color(0xffD9D9D9);
                          //   myRequestsButtonColor = const Color(0xffD9D9D9);
                          //   selectedCardIndex = 1;
                          // });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: state.tab == 0
                              ? AppColors.button
                              : AppColors.border,
                        ),
                        child: const Text('My Services',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // setState(() {
                          //   myServicesButtonColor = const Color(0xffD9D9D9);
                          //   quotationsButtonColor = AppColors.button;
                          //   myRequestsButtonColor = const Color(0xffD9D9D9);
                          //   selectedCardIndex = 0;
                          // });
                          context
                              .read<MyServiceBloc>()
                              .add(const ChangeTabEvent(index: 1));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Adjust the radius as needed
                          ),
                          backgroundColor: state.tab == 1
                              ? AppColors.button
                              : AppColors.border,
                        ),
                        child: const Text('Quotations',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // setState(() {
                          //   myServicesButtonColor = const Color(0xffD9D9D9);
                          //   quotationsButtonColor = const Color(0xffD9D9D9);
                          //   myRequestsButtonColor = AppColors.button;
                          //   selectedCardIndex = 2;
                          // });
                          context
                              .read<MyServiceBloc>()
                              .add(const ChangeTabEvent(index: 2));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: state.tab == 2
                              ? AppColors.button
                              : AppColors.border,
                        ),
                        child: const Text('My Requests',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                if (state.tab == 0) const ServiceListItem(),
                if (state.tab == 1) const QuotationListItem(),
                if (state.tab == 2)
                  _buildCardList([
                    'assets/images/img6.png',
                    'assets/images/img10.png',
                    'assets/images/img9.png',
                  ]),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCardQuotationList(
      List<String> imagePaths, List<String> buttonText) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return BuildButtonCard(
            imagePath: imagePaths[index],
            buttonText: buttonText[index],
            onPressed: () {
              if (buttonText[index] == 'Update Bid') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UpdateQuotationScreen(imagePath: imagePaths[index]),
                  ),
                );
              } else {}
            },
          );
        },
      ),
    );
  }

  Widget _buildCardList(List<String> imagePaths) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return BuildButtonCard(
            imagePath: imagePaths[index],
            buttonText: 'View Offers',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OffersScreen(imagePath: imagePaths[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
