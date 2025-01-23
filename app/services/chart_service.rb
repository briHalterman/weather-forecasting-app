class ChartService
  BASE_URL = "https://image-charts.com/chart"

  def generate_temperature_chart(dates, highs, lows)
    query = {
      cht: "lc",
      chd: "t:#{highs.join(',')}|#{lows.join(',')}",
      chxt: "x,y",
      chxl: "0:|#{dates.join('|')}",
      chco: "FF0000,0000FF"
    }

    "#{BASE_URL}?#{query.to_query}"
  end
end
