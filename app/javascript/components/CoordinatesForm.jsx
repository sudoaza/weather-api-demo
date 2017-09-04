import React from 'react'


export default class CoordinatesForm extends React.Component {
  getWeather(e) {
    e.preventDefault();
    var data = $(e.target).parent('form').serialize();
    $.ajax({
		  type: "GET",
		  url: '/api/v1/weather/coordinates',
		  data: data,
		  success: this.props.handleWeather,
		  error: function(jqXHR, textStatus, errorThrown) {
        console.log(jqXHR, textStatus, errorThrown);
      },
		  dataType: 'json'
		});
  }
  render() {
    return (
      <form>
        <input name="lat" placeholder="latitude" />
        <input name="lon" placeholder="longitude" />
        <button onClick={this.getWeather.bind(this)}>Submit</button>
      </form>
    );
  }
}
