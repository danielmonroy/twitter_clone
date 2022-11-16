import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'

import store from 'src/twitterStore';

import Twitter from 'src/Twitter';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={store}>
      <Twitter />
    </Provider>,
    document.getElementById('root'),
  )
})