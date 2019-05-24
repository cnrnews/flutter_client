import 'package:flutter/material.dart';
import 'package:app/data/asset.dart';

class GridViewWidget extends StatefulWidget {
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView widget'),
      ),
      body: GridViewBuilder(),
    );
  }
}

//GridView.builder
class GridViewBuilder extends StatelessWidget {
  Widget _buildGridItem(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].url,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _buildGridItem,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
    );
  }
}

//GridView.count
class GridViewCount extends StatelessWidget {
  List<Widget> _buildWidgets(int size) {
    return List.generate(size, (int index) {
      return Container(
        color: Colors.grey,
        child: Text('item $index'),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      scrollDirection: Axis.horizontal,
      children: _buildWidgets(100),
    );
  }
}
//GridView.extent
class GridViewExtent extends StatelessWidget {
  List<Widget> _buildWidgets(int size) {
    return List.generate(size, (int index) {
      return Container(
        color: Colors.grey,
        child: Text('item $index'),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      // crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      // scrollDirection: Axis.horizontal,
      children: _buildWidgets(100),
    );
  }
}
