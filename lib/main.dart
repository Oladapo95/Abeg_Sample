import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  void setStatusAndNavBarColors() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF753ff5),
      systemNavigationBarColor: Color(0xFF753ff5), // navigation bar color
    ));
  }

  @override
  Widget build(BuildContext context) {
    setStatusAndNavBarColors();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          FocusScope.of(context).requestFocus(new FocusNode());
        }
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Color(0xFF753ff5),
          primaryColor: Color(0xFF753ff5),
          scaffoldBackgroundColor: Color(0xFF753ff5),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const IconData money =
      IconData(0xe800, fontFamily: 'LoanCash', fontPackage: null);

  @override
  Widget build(BuildContext context) {
    const kKeyPadStyle = TextStyle(
      fontFamily: 'MuseoSans',
      fontSize: 28,
      //fontWeight: FontWeight.w700,
      color: Colors.white,
    );
    ValueNotifier<String> _amountToDisplay = ValueNotifier('');
    ValueNotifier<int> _amount = ValueNotifier(0);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Abeg',
            style: TextStyle(
              fontFamily: 'MuseoSans',
              fontSize: 28,
              //fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 80,
          leading: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Icon(
              Icons.person,
              size: 36,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24),
              child: Icon(
                Icons.notifications,
                size: 34,
              ),
            )
          ],
        ),
        backgroundColor: Color(0xFF753ff5),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Container(
                      child: Icon(
                        CupertinoIcons.money_dollar,
                        color: Colors.white,
                        size: 32,
                      ),
                      padding: EdgeInsets.all(12),
                      color: Color(0XFF6939dd),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ValueListenableBuilder(
                    valueListenable: _amountToDisplay,
                    builder: (context, String value, child) => Text(
                      value == '' ? '0' : formatFigure('$value'),
                      style: TextStyle(
                        fontFamily: 'MuseoSans',
                        fontSize: 58,
                        color: value == ''
                            ? Colors.white.withOpacity(0.5)
                            : Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 150,
                height: 34,
                child: Container(
                  alignment: Alignment.center,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      contentPadding: EdgeInsets.only(
                        bottom: 20 / 2, // HERE THE IMPORTANT PART
                      ),
                      filled: true,
                      fillColor: Color(0XFF804ef3),
                      hintStyle: new TextStyle(color: Colors.white),
                      hintText: "What is it for?",
                      enabled: true,
                      focusColor: Colors.red,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Number(
                            amountToDisplay: '1',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '1');
                            },
                          ),
                          Number(
                            amountToDisplay: '4',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '4');
                            },
                          ),
                          Number(
                            amountToDisplay: '7',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '7');
                            },
                          ),
                          Number(
                            amountToDisplay: '00',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '00');
                            },
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Number(
                            amountToDisplay: '2',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '2');
                            },
                          ),
                          Number(
                            amountToDisplay: '5',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '5');
                            },
                          ),
                          Number(
                            amountToDisplay: '8',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '8');
                            },
                          ),
                          Number(
                            amountToDisplay: '0',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '0');
                            },
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Number(
                            amountToDisplay: '3',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '3');
                            },
                          ),
                          Number(
                            amountToDisplay: '6',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '6');
                            },
                          ),
                          Number(
                            amountToDisplay: '9',
                            onTap: () {
                              _amountToDisplay.value =
                                  updateFigure(_amountToDisplay.value, '9');
                            },
                          ),
                          //Text('<', style: kKeyPadStyle),
                          GestureDetector(
                            onTap: () {
                              _amountToDisplay.value =
                                  removeLastCharacter(_amountToDisplay.value);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 10, left: 24),
                      decoration: BoxDecoration(
                        color: Color(0XFF804ef3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'REQUEST',
                        style: kKeyPadStyle.copyWith(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w300),
                      ),
                      height: 55,
                      alignment: Alignment.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 24, left: 10),
                      decoration: BoxDecoration(
                        color: Color(0XFF804ef3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'SEND',
                        style: kKeyPadStyle.copyWith(
                            fontSize: 16,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w300),
                      ),
                      height: 55,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF753ff5),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 2,
          selectedItemColor: Color(0XFFFFFFFF),
          unselectedItemColor: Color(0XFFb18aff),
          iconSize: 32,
          elevation: 0,
          selectedFontSize: 5,
          onTap: (d) {},
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag_fill),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                money,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.money_dollar),
                label: '',
                activeIcon: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    child: Icon(CupertinoIcons.money_dollar),
                    padding: EdgeInsets.all(10),
                    color: Color(0XFF6939dd),
                  ),
                )),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_2_fill),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_rounded),
              label: '',
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  String formatFigure(String s) {
    String first;
    String last;
    if (s.length > 3) {
      if (s.length == 4) {
        first = s.substring(0, 1);
        last = s.substring(1, 4);
        return first + ',' + last;
      }
      if (s.length == 5) {
        first = s.substring(0, 2);
        last = s.substring(2, 5);
        return first + ',' + last;
      }
      if (s.length == 6) {
        first = s.substring(0, 3);
        last = s.substring(3, 6);
        return first + ',' + last;
      } else {
        first = s.substring(0, 1);
        var middle = s.substring(1, 4);
        last = s.substring(4, 7);
        return first + ',' + middle + ',' + last;
      }
    } else
      return s;
  }

  String updateFigure(String s, newValue) {
    if (s == null || s == '') {
      if (newValue == '0' || newValue == '00') return '';
      return newValue;
    } else {
      var oldValue = s.replaceAll(',', '');
      var newResult = int.parse(oldValue + newValue);
      if (newResult > 1000000)
        return s;
      else
        return s + newValue;
    }
  }

  String removeLastCharacter(String str) {
    String result = '';
    if ((str != null) && (str.length > 0) && (str != '')) {
      result = str.substring(0, str.length - 1);
    }
    return result;
  }
}

class Number extends StatelessWidget {
  final String amountToDisplay;
  final Function onTap;

  Number({this.amountToDisplay, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(Radius.circular(40)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(amountToDisplay,
              style: TextStyle(
                fontFamily: 'MuseoSans',
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
