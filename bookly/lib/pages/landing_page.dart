import 'package:bookly/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LandingPage extends StatefulWidget {
	const LandingPage({super.key});

	@override
	State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
	//do this once to initiate the check of jwt and not each time this widget is called
	@override
	void initState() {
		super.initState();
    //wait for first frame to be rendered before navigating
		WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuth();
  	});
	}

	Future<void> checkAuth() async {
		final mobileStorage = FlutterSecureStorage();
		final token = await mobileStorage.read(key: 'accessToken');
    print('token' + token.toString());
		if (token == null) {
			Navigator.pushReplacementNamed(context, '/login');
    }
    else if (JwtDecoder.isExpired(token)) {
      await mobileStorage.delete(key: 'accessToken');
			Navigator.pushReplacementNamed(context, '/login');
    }
    else {
			Navigator.pushReplacementNamed(context, '/home');
		}
	}

	@override
	Widget build(BuildContext context) {
		return const Scaffold(
			backgroundColor: ThemeColors.yellow,
			body: Align(
				alignment: Alignment.center,
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						Expanded(child: Icon(Icons.handshake_outlined, size: 200)),
						Expanded(
							flex: 2,
							child: Column(
								children: [
									Text(
										"Bookly",
										style: TextStyle(fontSize: 80, color: ThemeColors.purple),
									),
									Text(
										"The best way to find and book local services",
										style: TextStyle(color: ThemeColors.purple, fontSize: 18),
									),
								],
							),
						),
					],
				),
			),
		);
	}
}
