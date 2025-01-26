class ChartService
  BASE_URL = "https://image-charts.com/chart"

  def generate_temperature_chart(dates, highs, lows)
    # Determine y-axis range dynamically
    min_temp = [ highs.min, lows.min ].min - 5
    max_temp = [ highs.max, lows.max ].max + 5

    query = {
      cht: "lc",
      chs: "700x400",
      chd: "t:#{highs.join(',')}|#{lows.join(',')}",
      chxt: "x,y",
      chxl: "0:|#{dates.join('|')}",
      chxr: "1,#{min_temp},#{max_temp}",
      chco: "FF0000,0000FF",
      chtt: "Daily Highs and Lows"
    }

    "#{BASE_URL}?#{query.to_query}"
  rescue StandardError => e
    { error: "Error: #{e.message}" }
  end
end
