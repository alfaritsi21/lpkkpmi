import axios from 'axios'
export default {
  state: {
    urlAPI: process.env.VUE_APP_URL,
    userName: '',
    userId: null,
    activityId: null,
    user: {},
    token: localStorage.getItem('token') || null
  },
  mutations: {
    setActivity(state, payload) {
      state.userName = payload.name
      state.userId = payload.user_id
      state.activityId = payload.id
    },
    setUser(state, payload) {
      state.user = payload
      state.token = payload.token
    },
    delUser(state) {
      state.user = {}
      state.token = null
      state.userId = null
      state.activityId = null
    }
  },
  actions: {
    interceptorRequest(context) {
      axios.interceptors.request.use(
        function(config) {
          config.headers.Authorization = `Bearer ${
            localStorage.getItem('user').token
          }`
          return config
        },
        function(error) {
          return Promise.reject(error)
        }
      )
    },
    interceptorResponse(context) {
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
              console.log('invalid signature')
              // localStorage.removeItem('token')
              // context.commit('delUser')
            } else if (error.response.data.msg === 'jwt expired') {
              // localStorage.removeItem('token')
              // context.commit('delUser')
              console.log('jwt expired')
            }
          }
          return Promise.reject(error)
        }
      )
    }
  },
  getters: {}
}
