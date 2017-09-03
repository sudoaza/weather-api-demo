import React from 'react'

export default class Weather extends React.Component {
  render() {
      if (typeof this.props.data.weather != "undefined") {
        return (
          <div>Current weather in {this.props.data.name}: {this.props.data.weather[0].main}</div>
        );
      } else {
        return null;
      }
  }
}
