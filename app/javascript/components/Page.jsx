import React from 'react'
import SearchCity from './SearchCity.jsx'
import SearchCoordinates from './SearchCoordinates.jsx'

export default class Page extends React.Component {
  render() {
    return (
      <div>
        <SearchCity /><br /><hr />
        <SearchCoordinates />
      </div>
    );
  }
}
