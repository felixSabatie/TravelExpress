<template>
  <div id="app">
    <Navbar :routes="routes" />
    <div class="router-view-container">
      <router-view/>
    </div>
  </div>
</template>

<script>
  import Navbar from '@/components/Navbar.vue'
  import {mapGetters} from 'vuex'

  export default {
    components: {
      Navbar
    },
    computed: {
      routes() {
        let routes = [{
          name: 'Rechercher',
          link: {
            name: 'search'
          }
        }]
        if(this.token) {
          routes.push({
            name: 'Créer un trajet',
            link: {
              name: 'new_lift'
            }
          }, {
            name: 'Modifier mes informations',
            link: {
              name: 'edit-account'
            }
          }, {
            name: 'Mes trajets',
            link: {
              name: 'user-lifts'
            }
          }, {
            name: 'Se déconnecter',
            link: {
              name: 'disconnect'
            }
          })
        } else {
          routes.push({
            name: 'Se connecter',
            link: {
              name: 'login'
            }
          }, {
            name: 'S\'inscrire',
            link: {
              name: 'register'
            }
          })
        }
        return routes
      },
      ...mapGetters({token: 'account_token'})
    }
  }
</script>

<style lang="scss">
  @import 'styles/app';

  #app {
    min-height: 100%;
    display: flex;
    flex-direction: column;

    .router-view-container {
      flex: 1;
      display: flex;
      flex-direction: column;
    }
  }
</style>
