<template>
  <div class="user-lifts container">
    <h3>Mes trajets</h3>
    <div v-if="drivers && drivers.length > 0">
      <h4>Conducteur</h4>
      <ListLifts :lifts="drivers" />
    </div>
    <div v-if="passengers && passengers.length > 0">
      <h4>Passager</h4>
      <ListLifts :lifts="passengers" />
    </div>

    <div v-if="!(passengers && passengers.length > 0) && !(passengers && passengers.length > 0)">
      Vous n'avez pas encore de trajet...
    </div>
  </div>
</template>

<script>
  import ListLifts from '../lift/ListLifts'
  import axios from '../../axios-wrapper'
  import {serverAddress} from "../../env";

  export default {
    data() {
      return {
        drivers: [],
        passengers: [],
      }
    },
    components: {
      ListLifts
    },
    mounted() {
      this.getCurrentUser()
    },
    methods: {
      getCurrentUser() {
        axios.get(`${serverAddress}/api/accounts/current/`)
          .then(response => {
            this.drivers = response.data.drivers
            this.passengers = response.data.passengers.map(passenger => passenger.lift)
          }).catch(error => {
          console.error(error)
        });
      }
    }
  }
</script>

<style lang="scss">

</style>
