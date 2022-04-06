import Vue from 'vue'
import Vuex from 'vuex'

import { auth } from './authmodule'
// import { sertifikasi } from './sertifikasi'
// import { galeri } from './galerimodule'
// import { download } from './downloadmodule'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    auth
    // sertifikasi
    // galeri,
    // download
  },
  getters: {
    getLoggedUserInfo() {
      return JSON.parse(localStorage.getItem('user'))
    }
    // getInfo () {
    //   return company.getters.getCompany()
    // },
  },
  // From store.js
  state: {
    barColor: 'rgba(0, 0, 0, .8), rgba(0, 0, 0, .8)',
    barImage: require('../assets/Oil-Rig.jpg'),
    drawer: false
  },
  mutations: {
    SET_BAR_IMAGE(state, payload) {
      state.barImage = payload
    },
    SET_DRAWER(state, payload) {
      state.drawer = payload
    }
  },
  actions: {}
})
