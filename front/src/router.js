import Vue from 'vue'
import Router from 'vue-router'
import NewLift from './views/lift/NewLift'
import ShowLift from './views/lift/ShowLift'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/lifts/new',
      name: 'new_lift',
      component: NewLift
    },
    {
      path: '/lifts/:id',
      name: 'show_lift',
      component: ShowLift
    }
  ]
})
