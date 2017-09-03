import React from 'react'
import SearchForm from './SearchForm.jsx'
import SearchResults from './SearchResults.jsx'
import Weather from './Weather.jsx'

export default class Search extends React.Component {
  constructor(props) {
    super(props);
    this.state = {searchResults: [], weather: {}};
  }
  handleSearchResults(data) {
    console.log(data);
    this.setState({searchResults: data});
  }
  handleWeather(data) {
    console.log(data);
    this.setState({weather: data});
  }
  render() {
    return (
      <div>
        <SearchForm handleSearchResults={this.handleSearchResults.bind(this)} />
        <SearchResults
          results={this.state.searchResults}
          handleWeather={this.handleWeather.bind(this)} />
        <Weather data={this.state.weather} />
      </div>
    )
  }
}
