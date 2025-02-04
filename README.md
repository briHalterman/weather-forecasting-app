# Weather Forecasting App

The **Weather Forecasting App** is a minimal web application that allows users to:
1. Save locations
- Using manually entered coordinates
- By entering an address, which is converted to coordinates using the [Geocode.xyz API](https://geocode.xyz)
- By IP address (detected and converted to coordinates using [ipapi](ipapi.co))
2. View a list of saved locations
3. Fetch and display 7-day weather forecast data (temperature highs and lows) for a specific location using the [Open Meteo API](https://open-meteo.com).
4. Visualize daily high and low temperatures each day using [Image-Charts](https://documentation.image-charts.com/).

## Setup Instructions

This app uses SQLite3 as the database. No additional setup is required for development.

### Clone the repository
```
git clone https://github.com/briHalterman/weather-forecasting-app.git
cd weather-forecasting-app
```
### Install Dependencies
```bundle install```
### Start the Rails Server
```rails s```
### Visit the app in your browser
Navigate to http://localhost:3000/locations to use the app.

## Running Tests
This project includes automated tests.

To run all tests, use:
```bundle exec rspec```


## Technologies Used
- **Ruby on Rails**: Backend framework
- **HTTParty**: API Integration
- **ActiveRecord**: ORM for database management
- **RSpec & Capybara**: Automated testing
- **Postman**: Manual API testing

## Known Issues and Limitations
- **Limited Error Handling**: Some edge cases are not yet handled.
- **Limited Styling**: The app lacks CSS styling.
- **Limited CRUD Functionality**: Users can create and read locations but cannot yet update or delete them.
- **Mixed Units**: Temperature is displayed in Fahrenheit while other data is displayed with metric units; A toggle to switch between US customary units and metric units would be a user friendly addition.
- **Accessible Design**
- **Chart Limitations**: Temperature chart does not properly handle negative temperatures.