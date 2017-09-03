import React from 'react'

export default class SearchForm extends React.Component {
  search(e) {
    e.preventDefault();
    var data = $(e.target).parent('form').serialize();
    $.ajax({
		  type: "GET",
		  url: '/api/v1/cities/search',
		  data: data,
		  success: this.props.handleSearchResults,
		  error: function(jqXHR, textStatus, errorThrown) {
        console.log(jqXHR, textStatus, errorThrown);
      },
		  dataType: 'json'
		});
  }
  render() {
    return (
      <form>
        <input name="q" placeholder="Berlin, DE" />
        <button onClick={this.search.bind(this)}>Submit</button>
      </form>
    );
  }
}
