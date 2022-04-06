import ApiService from './apiService'
const type = process.env.VUE_APP_BUILD_TYPE
class BuildType {
  apiURL(api) {
    switch (type) {
      case 'production':
        return ApiService.production(api)
      case 'development':
        return ApiService.development(api)
      case 'domain':
        return ApiService.domain(api)
      default:
        console.log('BOOOM')
    }
  }
}

export default new BuildType()
