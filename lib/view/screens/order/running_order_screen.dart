import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order_controller.dart';
import '../../../util/dimensions.dart';
import '../../base/custom_app_bar.dart';
import 'widget/history_order_widget.dart';

class RunningOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'running_orders'.tr),
      body: GetBuilder<OrderController>(builder: (orderController) {
        return orderController.currentOrderList != null
            ? orderController.currentOrderList.length > 0
                ? RefreshIndicator(
                    onRefresh: () async {
                      await orderController.getCurrentOrders();
                    },
                    child: Scrollbar(
                        child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Center(
                          child: SizedBox(
                        width: 1170,
                        child: ListView.builder(
                          padding:
                              EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                          itemCount: orderController.currentOrderList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return HistoryOrderWidget(
                                orderModel:
                                    orderController.currentOrderList[index],
                                isRunning: true,
                                index: index);
                          },
                        ),
                      )),
                    )),
                  )
                : Center(child: Text('no_order_found'.tr))
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}
