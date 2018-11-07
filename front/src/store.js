import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const defaultState = {
  account_token: "",
  account: {
    id: null,
    first_name: "",
    last_name: "",
    email: "",
  },
}

export default new Vuex.Store({
  state: defaultState,

  mutations: {
    SET_TOKEN: (state, token) => {
      state.account_token = token;
    },
    SET_ACCOUNT: (state, account) => {
      state.account = account;
    },
  },

  getters: {
    account_token: state => state.account_token,
    account: state => state.account,
  },

  actions: {
    setToken: (store, token) => {
      localStorage.setItem('user-token', token)
      store.commit('SET_TOKEN', token)
    },
    setCurrentAccount: (store, account) => {
      localStorage.setItem('user-account', JSON.stringify(account))
      store.commit('SET_ACCOUNT', account)
    },
    disconnect: (store) => {
      localStorage.removeItem('user-account')
      localStorage.removeItem('user-token')
      store.replaceState(defaultState)
    }
  }
})
