import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util';
import { receiveSearchGiphys, RECEIVE_SEARCH_GIPHYS } from './actions/giphy_actions'

document.addEventListener('DOMContentLoaded', () => {
    // debugger
    const store = configureStore();
    window.store = store;
    // window.fetchSearchGiphys = fetchSearchGiphys;
    // window.receiveSearchGiphys = receiveSearchGiphys;
    const root = document.getElementById('root');
    ReactDOM.render(
        <div>
            <Root store={store} />, 
         root

        </div>
        
    );
});
