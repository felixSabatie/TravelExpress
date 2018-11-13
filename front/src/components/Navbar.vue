<template>
  <div class="navbar">
    <nav>
      <div class="nav-wrapper container">
        <a href="/" class="brand-logo">Travel Express</a>
        <a href="#" data-target="mobile-nav" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li v-for="route in routes" :key="route.link.name">
            <router-link :to="route.link" >{{route.name}}</router-link>
          </li>
        </ul>
      </div>
    </nav>
    <ul class="sidenav" id="mobile-nav">
      <li v-for="route in routes" :key="route.link.name">
        <router-link :to="route.link" @click.native="closeSideNav">{{route.name}}</router-link>
      </li>
    </ul>
  </div>
</template>

<script>
  import M from 'materialize-css'

  export default {
    name: 'Navbar',
    props: ['routes'],
    mounted() {
      let sidenav = document.querySelectorAll('.sidenav');
      M.Sidenav.init(sidenav);
    },
    methods: {
      closeSideNav() {
        let sidenav = document.querySelector('.sidenav');
        M.Sidenav.getInstance(sidenav).close()
      }
    }
  }
</script>

<style lang="scss">
  @import '../styles/colors';

  .navbar {
    nav {
      background-color: $primary-color;

      .brand-logo {
        white-space: nowrap;
      }
    }
  }
</style>
