const API_DEV = process.env.VUE_APP_API_DEV
const API_PROD = process.env.VUE_APP_API_PROD
const API_DOMAIN = process.env.VUE_APP_API_DOMAIN

class ApiService {
  production(access) {
    switch (access) {
      case 'domain':
        return `${API_PROD}`
      default:
        return 'http://....'
    }
  }

  development(access) {
    switch (access) {
      case 'domain':
        return `${API_DEV}`
      default:
        return 'http://....'
    }
  }

  domain(access) {
    switch (access) {
      case 'domain':
        return `${API_DOMAIN}`
      default:
        return 'http://....'
    }
  }
}

export default new ApiService()
