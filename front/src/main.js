import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './materialize-bootstrapper'

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

// Get back data from cookies
const token = localStorage.getItem('user-token')
if(token) {
  store.commit('SET_TOKEN', token)
}
const account = JSON.parse(localStorage.getItem('user-account'))
if(account) {
  store.commit('SET_ACCOUNT', account)
}
