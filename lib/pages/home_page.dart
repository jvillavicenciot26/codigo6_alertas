import 'package:codigo6_alertas/pages/init_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: Column(
              children: [
                Text(
                  "Alertas Generales",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          14.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 12,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          "Secuestro al paso",
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Juan Manuel Ramos Garcia",
                            ),
                            Text(
                              "45120747",
                            ),
                            Text(
                              "2022/12/31 10:40 AM",
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
