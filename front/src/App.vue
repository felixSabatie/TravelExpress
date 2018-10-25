<template>
  <div id="app">
    <Navbar :routes="routes" />
    <div class="container">
      <router-view/>
    </div>
  </div>
</template>

<script>
  import Navbar from '@/components/Navbar.vue'

  export default {
    components: {
      Navbar
    },
    data: () => {
      return {
        routes: [
          {
            name: 'Créer un trajet',
            link: {
              name: 'new_lift'
            }
          }
        ]
      }
    }
  }
</script>

<style lang="scss">
  @import 'styles/app';
</style>
