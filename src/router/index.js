import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Login from '@/components/Login'
import Home from '@/pages/home/index'
import activePublic from '@/pages/home/activePublic'
import activeManage from '@/pages/home/activeManage'
import plantList from '@/pages/PlantList.vue'
import plantInfo from '@/pages/plant/PlantInfo.vue'
import plantAdd from '@/pages/plantAdd.vue'
import index from '@/pages/index.vue'
import plantindex from '@/pages/plant/plantindex.vue'
import plantcon from '@/pages/Plantcon.vue'
import gardenAdd from '@/pages/home/gardenadd.vue'
import gardenlist from '@/pages/home/gardenList.vue'
import plantupdate from '@/pages/plant/plantupdate.vue'
import forumList from '@/pages/forum/forumList.vue'

Vue.use(Router)
export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: index
    },
    {
      path: '/forum',
      name: 'conver',
      component: plantcon
    },
    {
      path: '/plant',
      name: 'plantindex',
      component: plantindex,
      children: [
          { path: 'plantList', component: plantList },
          { path: 'plantInfo', component: plantInfo }
      ]
    },
    {
      path: '/hello',
      name: 'HelloWorld',
      component: HelloWorld,
      meta: { requiresAuth: true }
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/home/',
      component: Home,
      children: [
                { path: 'activePublic', component: activePublic },
                { path: 'activeManage', component: activeManage },
                { path: 'plantList', component: plantList },
                { path: 'plantAdd', component: plantAdd },
                {path: 'plantUpdate', component: plantupdate},
                {path: 'gardenAdd', component: gardenAdd},
                {path: 'gardenList', component: gardenlist},
                {path: 'forumList', component: forumList}
      ]
    }
  ]
})
