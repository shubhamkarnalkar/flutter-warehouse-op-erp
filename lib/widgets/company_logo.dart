import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warehouse_erp/utils/utils.dart';

Widget companyLogo() => SvgPicture.asset(
      ImageConstant.logoCompanySVG,
      height: 45,
      width: 38,
      alignment: Alignment.centerLeft,
    );

Widget paddedCompanyLogo() => Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: companyLogo(),
      ),
    );
