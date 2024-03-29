import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return null;
            //    return BarTooltipItem(
            //   rod.toY.round().toString(),
            //   const TextStyle(
            //     color: primaryDark,
            //     fontWeight: FontWeight.bold,
            //   ),
            // );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: primaryDark,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tues';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thur';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  Widget customLeftTitles(dynamic value) {
    if (value >= 0 & (value < 5)) {
      return Image.asset(
        'images/sadEmoji.png',
        width: 20,
        height: 20,
      );
    } else if (value >= 5 & (value < 10)) {
      return Image.asset(
        'images/smiley.png',
        width: 20,
        height: 20,
      );
    } else if (value >= 10 & (value < 15)) {
      return Image.asset(
        'images/happyEmoji.png',
        width: 20,
        height: 20,
      );
    } else {
      return SizedBox();
    }
  }

  // Use custom function for left titles here

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          drawBelowEverything: true,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
            // sideTitles: sideTitles,
            ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          primaryLight,
          primaryDark,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 15,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 8,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 14,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [BarChartRodData(toY: 10, gradient: _barsGradient)],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [],
          showingTooltipIndicators: [0],
        ),
      ];
}

class HabitTrackingChart extends StatefulWidget {
  const HabitTrackingChart({super.key});

  @override
  State<StatefulWidget> createState() => HabitTrackingChartState();
}

class HabitTrackingChartState extends State<HabitTrackingChart> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.9,
      child: _BarChart(),
    );
  }
}
