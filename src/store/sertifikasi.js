export const vendor = {
  namespaced: true,
  state: {
    jumlahSkema: 0,
    jumlahAsesor: 0,
    jumlahAsesi: 0,
    jumlahTuk: 0
  },

  actions: {},

  mutations: {
    setSkema(state, data) {
      state.jumlahSkema = data
    },
    setAsesor(state, data) {
      state.jumlahAsesor = data
    },
    setAsesi(state, data) {
      state.jumlahAsesi = data
    },
    setTuk(state, data) {
      state.jumlahTuk = data
    }
  }
}
