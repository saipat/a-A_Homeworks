import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import applyMiddleware from 'redux';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, 
                            preloadedState,
                            applyMiddleware(addLoggingToDispatch, whateverMiddleware));
  

  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};


// const addLoggingToDispatch = (store) => {
//   const act = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     act(action);
//     console.log(store.getState()); 
//   };
// };

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};

const whateverMiddleware = store => next => action => {
  console.log("Silly");
  next(action);
};
export default configureStore;
