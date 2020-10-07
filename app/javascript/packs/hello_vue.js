/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.


import Vue from 'vue'
import App from '../components/app.vue'
import Vuelidate from 'vuelidate'
import store  from '../vuex/store'
import vueCookie from 'vue-cookie'
import axios from '../backend'
// import status from 'http-status'
import { pick } from "lodash";
import router from '../routes';
import VueRouter from 'vue-router'

import { library } from "@fortawesome/fontawesome-svg-core";
import { faThumbsUp as sfaThumbsUp, faReply } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { faThumbsUp as rfaThumbsUp } from "@fortawesome/free-regular-svg-icons";


library.add(sfaThumbsUp, faReply, rfaThumbsUp);
Vue.component("font-awesome-icon", FontAwesomeIcon);



Vue.use(VueRouter);
Vue.use(Vuelidate)
Vue.use(axios)
Vue.prototype.$http = axios.create()
Vue.use(vueCookie);



Vue.prototype.$http.interceptors.response.use((response) => {
  const authHeaders = pick(r.headers, ["access-token", "client", "expiry", "uid", "token-type"])
  store.commit('auth', authheaders)
  var session = vueCookie.get('session')

  if (session) {
    var session = JSON.parse(session)
    session['tokens'] = authHeaders

    vueCookie.set('session', JSON.stringify(session), {expires: '14D'})
  }
  return response
}, (error) => {
  if (router.currentRoute.name !== 'signin' && error.response.status === status.UNAUTHORIZED) {
    store.commit('user', null)
    router.push({name: 'signin'})
  }
return Promise.reject(error)
})


Vue.prototype.$http.interceptors.request.use((config) => {
  const headers = store.getters['auth'];

  // object that holds configuration of the request that's about to be made
  config.headers = headers;
  return config
})


document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    store,
    router,
    render: h => h(App),
  }).$mount()
  document.body.appendChild(app.$el)
})




// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue'
// import App from '../components/app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#app',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App },

//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
