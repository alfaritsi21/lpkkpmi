// =========================================================
// * Vuetify Material Dashboard - v2.1.0
// =========================================================
//
// * Product Page: https://www.creative-tim.com/product/vuetify-material-dashboard
// * Copyright 2019 Creative Tim (https://www.creative-tim.com)
//
// * Coded by Creative Tim
//
// =========================================================
//
// * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './plugins/base'
import './plugins/chartist'
import './plugins/vee-validate'
import vuetify from './plugins/vuetify'
import i18n from './i18n'
import VueSimpleAlert from 'vue-simple-alert'
import VuePdfApp from 'vue-pdf-app'

import JsonExcel from 'vue-json-excel'
import JsonCSV from 'vue-json-csv'

import VueHtml2pdf from 'vue-html2pdf'
import * as VueGoogleMaps from 'vue2-google-maps'

Vue.config.productionTip = false
Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyATI-pRchP7-f0ty8rsP6_Km-3cLvLf6OE',
    libraries: 'places'
  }
})

Vue.use(VueSimpleAlert)
Vue.component('vue-pdf-app', VuePdfApp)
Vue.component('downloadExcel', JsonExcel)
Vue.component('downloadCsv', JsonCSV)

Vue.use(VueHtml2pdf)

new Vue({
  router,
  store,
  vuetify,
  i18n,
  render: h => h(App)
}).$mount('#app')
