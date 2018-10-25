<template>
  <div class="show-lift">
    <div v-if="loading">
      <Loader />
    </div>
    <div v-else-if="lift !== undefined">
      <h2>Hello lift</h2>
    </div>
    <div v-else>
      <Unfound />
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import {serverAddress} from '../../env'
  import Unfound from '../Unfound'
  import Loader from '../Loader'

  export default {
    data() {
      return {
        lift: undefined,
        loading: true
      }
    },
    components: { Unfound, Loader },
    mounted() {
      let liftId = Number(this.$route.params.id)
      if(!isNaN(liftId)) {
        axios.get(`${serverAddress}/api/lifts/${liftId}`).then(response => {
          this.lift = response.data
          this.loading = false
        }).catch(error => {
          this.loading = false
        })
      } else {
        this.loading = false
      }
    }
  }
</script>

<style lang="scss">

</style>
