import React from 'react';
import { Route }         from 'react-router-dom';
import Greeting          from './greeting/greeting_container';
export default () => (
  <div>
    <Route path="/" component={Greeting} />
  </div>
)