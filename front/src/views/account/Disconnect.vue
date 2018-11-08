<template>
  <div class="disconnect container">
    <h3>Vous avez bien été déconnecté(e)</h3>
  </div>
</template>

<script>
  import {mapActions} from 'vuex'
  import store from '../../store'

  export default {
    mounted() {
      this.disconnect(store)
    },
    methods: {
      ...mapActions(['disconnect'])
    }
  }
</script>

<style lang="scss">
  @import '../../styles/colors';

  .disconnect {
    color: $grey-text-color;
  }
</style>
