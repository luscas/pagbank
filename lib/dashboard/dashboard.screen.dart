import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pagbank/dashboard/components/circular_paint.dart';
import 'package:pagbank/data/user.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  final formatCurrency = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  double sliderValue = 0.0;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    animation = Tween<double>(begin: 0.0, end: 0.75).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double creditCardLimitAvailable = User().creditCard.limit - User().creditCard.used;
    final double creditCardLimitUsedPercentage = (User().creditCard.used / User().creditCard.limit) * 100;
    final double creditCardProgressLimit = MediaQuery.of(context).size.width - 88.0;
    final double creditCardProgressLimitUsed = ((creditCardProgressLimit / 100) * creditCardLimitUsedPercentage);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white12,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('images/logo.png', width: 130.0, height: 35.0),

                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 37.0,
                                  height: 37.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Image.asset('images/remind.png'),
                                ),

                                // Pin notifications
                                Positioned(
                                  top: 7.4,
                                  right: 8.1,
                                  child: Container(
                                    width: 9.26,
                                    height: 9.26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.0),
                                      color: const Color(0xFF1D1D1D),
                                    ),
                                    padding: const EdgeInsets.all(1.33),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100.0),
                                        color: const Color(0xFFBAC803),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8.0),
                            Container(
                              width: 37.0,
                              height: 37.0,
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset('images/people.png'),
                            )
                          ],
                        )
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Text('Saldo',
                        style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.50))
                      ),
                    ),
                    const SizedBox(height: 2.75),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SelectableText(formatCurrency.format(User().money),
                          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Colors.white)
                        ),
                        IconButton(
                          onPressed: () {},
                          splashRadius: 18.0,
                          icon: Image.asset('images/preview-open.png'),
                        )
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('A receber',
                            style: TextStyle(fontSize: 15, color: Colors.white70)
                          ),
                          SelectableText(formatCurrency.format(User().moneyInQueue),
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white)
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('Ver detalhes do saldo',
                              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                            Icon(Icons.keyboard_arrow_right, size: 16.0),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side: BorderSide(
                            color: Colors.white.withOpacity(0.10),
                            width: 1.5,
                          )
                        ),
                      ),
                    ),

                    Container(
                      height: 142.0,
                      padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 16.0),
                      margin: const EdgeInsets.only(top: 30.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF51B9B5),
                            Color(0xFFC1CD20),
                            Color(0xFFDABF17),
                          ],
                          stops: [0.25, 0.7, 1.0],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                        )
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Fatura atual',
                                    style: TextStyle(fontSize: 15.0, color: Colors.white.withOpacity(0.80)),
                                  ),
                                  SelectableText(
                                    formatCurrency.format(User().creditCard.used),
                                    style: const TextStyle(fontSize: 26.0, fontWeight: FontWeight.w500, color: Colors.white),
                                  )
                                ],
                              ),
                              Image.asset('images/visa.png'),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 4.0,
                            margin: const EdgeInsets.only(top: 25.0),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: creditCardProgressLimitUsed,
                                  height: 4.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 8.68),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Limite dispon??vel',
                                style: TextStyle(fontSize: 13.33, color: Colors.white)
                              ),
                              Text(
                                formatCurrency.format(creditCardLimitAvailable),
                                style: const TextStyle(fontSize: 13.33, fontWeight: FontWeight.w500, color: Colors.white)
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 25.0, right: 25.0,),
                child: Row(
                  children: [
                    // const CircularArc(),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143,195,103,0.18),
                            blurStyle: BlurStyle.outer,
                            blurRadius: 18.0
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(82,184,180,0.18),
                            blurStyle: BlurStyle.outer,
                            blurRadius: 18.0,
                          )
                        ]
                      ),
                      child: CustomPaint(
                        size: const Size(55, 55), // no effect while adding child
                        painter: CircularPaint(
                          progressValue: animation.value.toDouble(),
                        ),
                        child: Center(
                          child: Image.asset('images/user.png'),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 24.0, right: 6.70),
                        child: Wrap(
                          children: [
                            const Text('Falta pouco!',
                              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                            Text('Complete as etapas e libere todos os servi??os gratuitos',
                              style: TextStyle(fontSize: 15.0, color: Colors.white.withOpacity(0.70)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Image.asset('images/chevron-right.png', width: 24.0, height: 24.0),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),

              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 12),
                child: Text('Servi??os',
                  style: TextStyle(fontSize: 15.0, color: Colors.white.withOpacity(0.70)),
                ),
              ),

              Container(
                height: 98.3,
                margin: const EdgeInsets.only(bottom: 35.0),
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 98.3,
                      height: 98.3,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white.withOpacity(0.15)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('images/bank-transfer.png'),
                          const Text('Cart??es',
                            style: TextStyle(fontSize: 14.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Stack(
                      children: [
                        Positioned(
                          top: 8.0,
                          right: 8.0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.50),
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Text('12x',
                              style: TextStyle(fontSize: 10.0, color: Colors.white),
                            )
                          ),
                        ),
                        Container(
                          width: 98.3,
                          height: 98.3,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white.withOpacity(0.15)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('images/qrcode.png'),
                              const Text('Pagar Contas',
                                style: TextStyle(fontSize: 14.0, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Stack(
                      children: [
                        Positioned(
                          top: 8.0,
                          right: 8.0,
                          child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.50),
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Text('B??nus',
                                style: TextStyle(fontSize: 10.0, color: Colors.white),
                              )
                          ),
                        ),
                        Container(
                          width: 98.3,
                          height: 98.3,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white.withOpacity(0.15)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('images/iphone.png'),
                              const Text('Recarga',
                                style: TextStyle(fontSize: 14.0, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 98.3,
                      height: 98.3,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white.withOpacity(0.15)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('images/open-an-account.png'),
                          const Text('Adicionar Dinheiro',
                            style: TextStyle(fontSize: 14.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ]
                )
              )
            ],
          ),
        )
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80 + (MediaQuery.of(context).viewPadding.bottom),
        padding: const EdgeInsets.only(top: 20.0),
        decoration: const BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('images/home.png'),
                const SizedBox(height: 3.25),
                const Text('Home',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset('images/extract.png', color: Colors.white54),
                const SizedBox(height: 3.25),
                const Text('Extrato',
                  style: TextStyle(fontSize: 14.0, color: Colors.white54),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset('images/sales-report.png', color: Colors.white54),
                const SizedBox(height: 3.25),
                const Text('Vendas',
                  style: TextStyle(fontSize: 14.0, color: Colors.white54),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset('images/bank-card.png', color: Colors.white54),
                const SizedBox(height: 3.25),
                const Text('Cart??es',
                  style: TextStyle(fontSize: 14.0, color: Colors.white54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
