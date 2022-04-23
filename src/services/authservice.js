import axios from 'axios'
// import ApiService from './apiService'
// import buildType from './buildType'

// const API_URL = ApiService.development('users')
// const API_URL = buildType.apiURL('domain')

class AuthService {
  login(user) {
    return axios
      .post('http://localhost:3001/users/login', {
        // .post(API_URL + '/users/login', {
        username: user.username,
        password: user.password
      })
      .then((response) => {
        if (response.status === 200) {
          localStorage.setItem('user', JSON.stringify(response.data.data))
        }
        return response.data
      })
  }

  // verifyToken(pToken) {
  //   return axios
  //     .get(
  //       API_URL + '/user/verify_token?token=' + pToken + '&method=conventional'
  //     )
  //     .then(response => {
  //       return response.data
  //     })
  // }

  logout() {
    localStorage.removeItem('user')
  }
}

export default new AuthService()
