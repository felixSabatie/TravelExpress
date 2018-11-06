import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    account_token: String,
    account: {
      id: Number,
      first_name: String,
      last_name: String,
      email: String,
    },
  },

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
      store.commit('SET_TOKEN', token)
    },
    setCurrentAccount: (store, account) => {
      store.commit('SET_ACCOUNT', account)
    }
  }
})
