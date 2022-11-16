import React from 'react'
import ReactDOM from 'react-dom'

import Twitter from '../components/Twitter';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Twitter/>,
    document.body.appendChild(document.createElement('div')),
  )
})