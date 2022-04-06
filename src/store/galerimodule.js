// import VendorService from '../services/galeriservice'

// export const vendor = {
//   namespaced: true,
//   state: {
//     vendors: [],
//     response: [],
//     act: 'add'
//   },

//   actions: {
//     getVendorById({ commit }, pParam) {
//       return VendorService.getVendorById(pParam).then(
//         _response => {
//           commit('getVendorById', _response)
//           return Promise.resolve(_response)
//         },
//         _error => {
//           return Promise.reject(_error)
//         }
//       )
//     },

//     saveVendor({ commit }, pParam) {
//       return VendorService.saveVendor(pParam).then(
//         _response => {
//           commit('saveVendor', _response)
//           return Promise.resolve(_response)
//         },
//         _error => {
//           return Promise.reject(_error)
//         }
//       )
//     }
//   },

//   mutations: {
//     getVendorById(state, data) {
//       state.vendors = data
//     },

//     saveVendor(state, data) {
//       state.response = data
//     }
//   }
// }
