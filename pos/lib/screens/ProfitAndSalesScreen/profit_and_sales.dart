import 'package:flutter/material.dart';
import 'package:pos/labels.dart';
import 'package:pos/screens/ProfitAndSalesScreen/components/profit_and_sales_widget.dart';
import 'package:pos/CommonWidgets/heading.dart';

class ProfitAndSales extends StatelessWidget {
  const ProfitAndSales({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/bg_image1.png',
              fit: BoxFit.cover,
            ),
          ),
          // Other widgets placed on top of the background
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Heading(
                  text: Labels.profitAndSalesHeading(),
                  fontSize: 32.4,
                  fontWeight: FontWeight.bold,
                  textColor: const Color(0xFF49688D)),
              const SizedBox(
                height: 30,
              ),
              ProfitAndSalesWidget(
                iconColor: const Color(0xFF49688D),
                text: Labels.from(),
                borderColor: const Color(0xFF49688D),
                textColor: const Color(0xFF49688D),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 30,
                borderWidth: 1,
                borderRadius: BorderRadius.circular(100),
                fontSize: 14,
                fontWeight: FontWeight.normal,
                icon: Icons.calendar_month_rounded,
              ),
              const SizedBox(
                height: 15,
              ),
              ProfitAndSalesWidget(
                text: Labels.to(),
                iconColor: const Color(0xFF49688D),
                borderColor: const Color(0xFF49688D),
                textColor: const Color(0xFF49688D),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 30,
                borderWidth: 1,
                borderRadius: BorderRadius.circular(100),
                fontSize: 14,
                fontWeight: FontWeight.normal,
                icon: Icons.calendar_month_rounded,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              ProfitAndSalesWidget(
                  text: Labels.cost(),
                  borderColor: const Color(0xFF49688D),
                  textColor: const Color(0xFF49688D),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 45,
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(15),
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  iconColor: const Color(0xFF49688D)),
              const SizedBox(
                height: 30,
              ),
              ProfitAndSalesWidget(
                  text: Labels.sales(),
                  borderColor: const Color(0xFF49688D),
                  textColor: const Color(0xFF49688D),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 45,
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(15),
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  iconColor: const Color(0xFF49688D)),
              const SizedBox(
                height: 30,
              ),
              ProfitAndSalesWidget(
                  text: Labels.profit(),
                  borderColor: const Color(0xFF49688D),
                  textColor: const Color(0xFF49688D),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 45,
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(15),
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  iconColor: const Color(0xFF49688D)),
              // Add other widgets here as needed
            ],
          ),
        ],
      ),
    );
  }
}
