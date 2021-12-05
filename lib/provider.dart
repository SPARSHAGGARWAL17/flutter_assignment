import 'package:flutter_assignment/bloc/product-cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> provider = [
  BlocProvider<ProductCubit>(create: (context) => ProductCubit(),),
];
