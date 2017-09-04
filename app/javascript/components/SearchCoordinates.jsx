import React from 'react'
import CoordinatesForm from './CoordinatesForm.jsx'
import Weather from './Weather.jsx'

export default class SearchCoordinates extends React.Component {
  constructor(props) {
    super(props);
    this.state = {weather: {}};
  }
  handleWeather(data) {
    console.log(data);
    this.setState({weather: data});
  }
  render() {
    return (
      <div>
        <CoordinatesForm handleWeather={this.handleWeather.bind(this)} />
        <Weather data={this.state.weather} />
      </div>
    )
  }
}
