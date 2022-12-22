import 'package:flutter/material.dart';
import 'package:hilytest/Slider.dart';

class Slidee extends StatefulWidget {
  @override
  _SlideeState createState() => _SlideeState();
}

class _SlideeState extends State<Slidee> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "Imam Kini",
        description: "Kini anda boleh mengetahui imam dan bilal kegemaran anda. "),
    SliderPage(
        title: "Program terkini",
        description:
            "Ketahui program yg dijalankan di Masjid Khalifah."),
    SliderPage(
        title: "Daftar Akaun",
        description: "Daftar Akaun untuk mengetahui info selanjutnya mengenai Masjid Khalifah."),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.yellow
                                : Colors.yellow.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);

                  Navigator.pushNamed(context, '/LoginChoose');
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? Text(
                          "Teruskan",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                          ),
                        )
                      : Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.grey[600],
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
