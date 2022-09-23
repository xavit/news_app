import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  // AutomaticKeepAliveClientMixin es para mantener el estado de la página
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      // body: ListaNoticias(noticias: newsService.headlines),
      body: (newsService.headlines == 0)
          ? const Center(child: CircularProgressIndicator())
          : ListaNoticias(noticias: newsService.headlines),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
