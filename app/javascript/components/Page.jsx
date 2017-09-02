import React from 'react'

export class SearchForm extends React.Component {
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


export class SearchResults extends React.Component {
  constructor(props) {
    super(props);
    if ( this.props.length > 0 ) {
      this.message = "Found " + this.props.length;
    } else {
      this.message = "Search for something"
    }
  }
  render() {
    return (
      <div>
        <p>{this.message}</p>
        {this.props.results.map(function(result) {
          return (
            <SearchResult data={result} key={result.id} />
          )
        })}
      </div>
    );
  }
}

export class SearchResult extends React.Component {
  render() {
    return (
      <div>
        {this.props.data.name}
      </div>
    );
  }
}

export class Search extends React.Component {
  constructor(props) {
    super(props);
    this.state = {searchResults: []};
  }
  handleSearchResults(data) {
    console.log(data);
    this.setState({searchResults: data});
  }
  render() {
    return (
      <div>
        <SearchForm handleSearchResults={this.handleSearchResults.bind(this)} />
        <SearchResults results={this.state.searchResults} />
      </div>
    )
  }
}

export class Page extends React.Component {
  render() {
    return (
      <div>
        <Search />
      </div>
    );
  }
}
