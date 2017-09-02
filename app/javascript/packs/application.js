import React from 'react';
import { render } from 'react-dom';
import {Page, SearchForm, SearchResults} from '../components/Page.jsx';
import jQuery from 'jquery'

window.jQuery = jQuery

document.addEventListener('DOMContentLoaded', () => {
  const container = document.body.appendChild(document.createElement('div'));
  render(<Page/>, container);
});
