# Weather Forecasting App

The **Weather Forecasting App** is a minimal web application that allows users to:
1. Save locations (cities) in memory with their name, latitude, and longitude.
2. View a list of saved locations.
3. Fetch and display 7-day weather forecast data (temperature highs and lows) for a specific location using the [Open Meteo API](https://open-meteo.com).

## Setup Instructions

### Clone the repository
### Install Dependencies
### Start the Rails Server
### Visit the app in your browser
Navigate to http://localhost:3000/locations to use the app.

## Technologies Used
- **Ruby on Rails**: Backend and Views
- **HTTParty**: API Integration with Open Meteo
- **Postman**: Testing

## Known Issues and Limitations
- **No Persistent Storage**: Data is saved only in memory and will reset when the server restarts.
- **Manual Location Entry**: Users must manually enter location coordinates.
- **Limited Error Handling**: Edge cases and error scenarios are not yet handled.
- **No Styling**: The app currently lacks any CSS or design.
- **No Tests**: Automated tests are not yet implemented.
