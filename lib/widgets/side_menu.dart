import 'package:flutter/material.dart';
import 'package:spotify_clone/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/spotify_logo.png',
                height: 55.0,
                filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTab(context,Icons.home,'Home',(){}),
          _SideMenuIconTab(context,Icons.search,'Search',(){}),
          _SideMenuIconTab(context,Icons.audiotrack,'Radio',(){}),
          const SizedBox(height: 12.0),
          const _LibraryPlayLists(),


        ],
      ),

    );
  }

  ListTile _SideMenuIconTab(BuildContext context, IconData iconData, String title, VoidCallback onTap) {
    return ListTile(
          leading: Icon(iconData,
          color: Theme.of(context).iconTheme.color,
            size: 20.0,
          ),

          title: Text(title,
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
          ),
      onTap: onTap,

        );
  }
}

class _LibraryPlayLists extends StatefulWidget {
  const _LibraryPlayLists({Key? key}) : super(key: key);

  @override
  _LibraryPlayListsState createState() => _LibraryPlayListsState();
}

class _LibraryPlayListsState extends State<_LibraryPlayLists> {
  ScrollController? _scrollController;

  @override
  void initState(){
    super.initState();
    _scrollController=ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: Text("YOUR LIBRARY",
                  style: Theme.of(context).textTheme.headline4,
                  overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary.map(
                    (e)=> ListTile(
                      dense: true,
                      title: Text(e,style: Theme.of(context).textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                      ),
                      onTap: (){},
                    )
                ).toList(),
              ],
            ),
            const SizedBox(height: 24.0,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: Text("PLAYLISTS",
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map(
                        (e)=> ListTile(
                      dense: true,
                      title: Text(e,style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: (){},
                    )
                ).toList(),
              ],
            )

          ],
        ),
      ),
    );
  }
}
