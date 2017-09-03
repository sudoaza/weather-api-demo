import React from 'react'

export default class SearchResult extends React.Component {
  getWeather(e) {
    e.preventDefault();
    var url = $(e.target).attr('href');
    $.ajax({
		  type: "GET",
		  url: url,
		  success: this.props.handleWeather,
		  error: function(jqXHR, textStatus, errorThrown) {
        console.log(jqXHR, textStatus, errorThrown);
      },
		  dataType: 'json'
		});
  }
  render() {
    var url = "/api/v1/cities/"+ this.props.data.id;
    return (
      <div>
        <a href={url}
          onClick={this.getWeather.bind(this)}>
          {this.props.data.name}, {this.props.data.sys.country}</a>
      </div>
    );
  }
}
