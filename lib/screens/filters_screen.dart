import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({super.key, this.saveFilters});
  static const screenRoute = '/filters';
  final dynamic saveFilters;
  final Map<String, bool> currenfilters;

  const FilterScreen(this.currenfilters, this.saveFilters, {super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;
  @override
  void initState() {
    _summer = widget.currenfilters['summer']!;
    _winter = widget.currenfilters['winter']!;
    _family = widget.currenfilters['family']!;
    // TODO: implement initState
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, var currentValue, dynamic updatValue) {
    return SwitchListTile(
      activeColor: Colors.orange,
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updatValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'الفلترة',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'summer': _summer,
                  'winter': _winter,
                  'family': _family,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                'الرحلات الصيفية',
                'إالرحلاتفي فصل الصيف',
                _summer,
                (newValue) {
                  setState(
                    () {
                      _summer = newValue;
                    },
                  );
                },
              ),
              buildSwitchListTile(
                ' الرحلات الشتوية فقط',
                'إالرحلاتفي فصل الشتاء فقط',
                _winter,
                (newValue) {
                  setState(
                    () {
                      _winter = newValue!;
                    },
                  );
                },
              ),
              buildSwitchListTile(
                'الرحلات العائلية فقط',
                'إالرحلاتفي التي للعائلات فقط',
                _family,
                (newValue) {
                  setState(
                    () {
                      _family = newValue!;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
