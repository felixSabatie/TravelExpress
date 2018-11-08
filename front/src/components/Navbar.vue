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
        <router-link :to="route.link">{{route.name}}</router-link>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
    name: 'Navbar',
    props: ['routes']
  }
</script>

<style lang="scss">
  @import '../styles/colors';

  .navbar {
    nav {
      background-color: $primary-color;
    }
  }
</style>
