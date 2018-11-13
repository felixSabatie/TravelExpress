import Vue from 'vue'
import Router from 'vue-router'
import NewLift from './views/lift/NewLift'
import ShowLift from './views/lift/ShowLift'
import Login from './views/account/Login'
import Register from './views/account/Register'
import Disconnect from './views/account/Disconnect'
import SearchLift from './views/lift/SearchLift'
import EditAccount from './views/account/Edit'
import UserLifts from './views/account/UserLifts'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      redirect: {name: 'search'}
    },
    {
      path: '/lifts/new',
      name: 'new_lift',
      component: NewLift
    },
    {
      path: '/lifts/:id',
      name: 'show_lift',
      component: ShowLift
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
    },
    {
      path: '/register',
      name: 'register',
      component: Register,
    },
    {
      path: '/disconnect',
      name: 'disconnect',
      component: Disconnect,
    },
    {
      path: '/search',
      name: 'search',
      component: SearchLift,
    },
    {
      path: '/account/edit',
      name: 'edit-account',
      component: EditAccount,
    },
    {
      path: '/account/lifts',
      name: 'user-lifts',
      component: UserLifts,
    },
  ]
})
