import 'dart:html' as html;
import 'package:angular/angular.dart';
import 'package:modern_charts/modern_charts.dart';
import 'package:angular_modern_charts/angular_modern_charts.dart';

@Component(
    selector: 'piechart',
    styleUrls: const ['piechart_component.css'],
    templateUrl: 'piechart_component.html'
)
class PieChartComponent implements AfterViewInit, OnChanges, OnDestroy
{
  PieChartComponent(this._hostElement);

  void ngAfterViewInit()
  {
    _chart = new PieChart(_hostElement.querySelector('#chart'));
  }

  ngOnChanges(Map<String, SimpleChange> changes)
  {
    if (_chart != null && chartData != null) _chart.draw(chartData.encoded);
  }

  void ngOnDestroy()
  {
    _chart.free();
  }

  PieChart _chart;
  final html.Element _hostElement;

  @Input()
  bool loading = false;

  @Input()
  PieChartProperties chartProperties = new PieChartProperties("300px");

  @Input()
  PieChartData chartData;
}

