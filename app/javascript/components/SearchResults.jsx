import React from 'react'
import SearchResult from './SearchResult.jsx'

export default class SearchResults extends React.Component {
  constructor(props) {
    super(props);
    this.setMessage();
  }
  setMessage() {
    if ( this.props.results.length > 0 ) {
      this.message = "Found " + this.props.results.length;
    } else {
      this.message = "Nothing found. Search for something else";
    }
  }
  render() {
    this.setMessage();
    var handleWeather = this.props.handleWeather;
    return (
      <div>
        <p>{this.message}</p>
        {this.props.results.map(function(result) {
          return (
            <SearchResult
              data={result}
              key={result.id}
              handleWeather={handleWeather} />
          );
        })}
        <br />
      </div>
    );
  }
}
