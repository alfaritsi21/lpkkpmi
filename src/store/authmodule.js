import AuthService from '../services/authservice'
import axios from 'axios'
const user = JSON.parse(localStorage.getItem('user'))
const initialState = user
  ? { status: { loggedIn: true }, user }
  : { status: { loggedIn: false }, user: null }

export const auth = {
  namespaced: true,
  state: initialState,

  actions: {
    login({ commit }, user) {
      return AuthService.login(user).then(
        user => {
          if (user.status === 400) {
            commit('loginFailure')
            return Promise.reject(user.msg)
          } else {
            commit('loginSuccess', user)
            return Promise.resolve(user)
          }
        },
        error => {
          commit('loginFailure')
          return Promise.reject(error)
        }
      )
    },

    // verifyToken({ commit }) {
    //   return AuthService.verifyToken(user.token).then(
    //     response => {
    //       console.log(user.token)
    //       if (response.status_code === '-99') {
    //         commit('loginFailure')
    //         return Promise.reject(response.status_msg)
    //       }
    //     },
    //     error => {
    //       commit('loginFailure')
    //       return Promise.reject(error)
    //     }
    //   )
    // },

    logout({ commit }) {
      AuthService.logout()
      commit('logout')
    },
    interceptorRequest() {
      axios.interceptors.request.use(
        function(config) {
          if (localStorage.getItem('user') !== null) {
            config.headers.Authorization = `Bearer ${
              JSON.parse(localStorage.getItem('user')).token
            }`
          }
          return config
        },
        function(error) {
          return Promise.reject(error)
        }
      )
    },
    interceptorResponse({ commit }) {
      axios.interceptors.response.use(
        function(response) {
          return response
        },
        function(error) {
          if (error.response.status === 400) {
            if (
              error.response.data.msg === 'invalid token' ||
              error.response.data.msg === 'invalid signature'
            ) {
              AuthService.logout()
              commit('logout')
            } else if (error.response.data.msg === 'jwt expired') {
              AuthService.logout()
              commit('logout')
            }
          }
          return Promise.reject(error)
        }
      )
    }
  },

  mutations: {
    loginSuccess(state, user) {
      state.status.loggedIn = true
      state.user = user
    },
    loginFailure(state) {
      state.status.loggedIn = false
      state.user = null
    },
    logout(state) {
      state.status.loggedIn = false
      state.user = null
    }
  }
}
