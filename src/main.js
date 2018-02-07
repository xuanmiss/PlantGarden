// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-default/index.css'
import 'normalize.css'
import axios from 'axios'
import iView from 'iview'
import 'iview/dist/styles/iview.css'
// import store from './vuex/store'

Vue.use(ElementUI)
Vue.prototype.$axios = axios
Vue.config.productionTip = false
Vue.use(router)
Vue.use(iView)

// var bus = new Vue()
/* eslint-disable no-new */
new Vue({
  el: '#app',
  axios,

  router,
  template: '<App/>',
  components: { App }
})
