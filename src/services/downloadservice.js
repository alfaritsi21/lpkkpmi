import axios from 'axios'
import buildType from './buildType'

const API_URL = buildType.apiURL('domain')

class DownloadService {
  getTemplate(pParam) {
    var xQueryStr = `/template/${pParam.module}`
    axios({
      url: API_URL + xQueryStr,
      method: 'GET',
      responseType: 'blob'
    }).then(response => {
      return response
    })
  }
}

export default new DownloadService()
