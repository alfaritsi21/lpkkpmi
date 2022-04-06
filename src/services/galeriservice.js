// import axios from 'axios'
// import authHeader from './authheader'
// import ApiService from './apiService'

// const API_URL = ApiService.development('users')

// class NewsService {
//   getVendorById(pParam) {
//     var xStrQuery = `/${pParam.id}`
//     return axios
//       .get(API_URL + '/master/vendor/id' + xStrQuery, {
//         headers: authHeader()
//       })
//       .then(response => {
//         console.log('>>> Vendor : ' + JSON.stringify(response.data))
//         return response.data
//       })
//   }

//   saveVendor(pParam) {
//     console.log(pParam)
//     return axios
//       .post(API_URL + '/master/vendor/single_save', pParam, {
//         headers: authHeader()
//       })
//       .then(response => {
//         return response.data
//       })
//   }
// }

// export default new NewsService()
