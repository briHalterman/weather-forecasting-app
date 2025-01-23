# Weather Forecasting App

The **Weather Forecasting App** is a minimal web application that allows users to:
1. Save locations in memory
- Using manually entered coordinates
- By entering an address, which is converted to coordinates using the [Geocode.xyz API](https://geocode.xyz).
- By IP address (detected and converted to coordinates using [ipapi](ipapi.co))
2. View a list of saved locations.
3. Fetch and display 7-day weather forecast data (temperature highs and lows) for a specific location using the [Open Meteo API](https://open-meteo.com).

## Setup Instructions

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

## Technologies Used
- **Ruby on Rails**: Backend and Views
- **HTTParty**: API Integration
- **Postman**: Testing

## Known Issues and Limitations
- **No Persistent Storage**: Data is saved only in memory and will reset when the server restarts.
- **Limited Error Handling**: Edge cases and many error scenarios are not yet handled.
- **Limited Styling**: The app currently lacks CSS styling.
- **No Tests**: Automated tests are not yet implemented.
- **Limited CRUD Functionality**: Users can create and read locations, but cannot yet to update or delete locations.
- **Metric Only**: Data is displayed with metric units; A toggle to switch to US customary units would be a user friendly addition.
- **Failing Linting Tests**