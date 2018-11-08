<template>
  <div class="search">
    <h3>Rechercher un trajet</h3>

    <div class="form">
      <form @submit.prevent="search()">
        <div class="row">
          <div class="input-field col m6 s12">
            <i class="material-icons prefix">place</i>
            <input v-model.trim="query.from" id="departure_city" type="text" class="validate" required>
            <label for="departure_city">Ville de départ</label>
          </div>
          <div class="input-field col m6 s12">
            <i class="material-icons prefix">flag</i>
            <input v-model.trim="query.to" id="arrival_city" type="text" class="validate" required>
            <label for="arrival_city">Ville d'arrivée</label>
          </div>
        </div>
        <div class="row">
          <button class="btn right"><i class="material-icons left">search</i>Rechecher</button>
        </div>
      </form>
    </div>

    <div class="results">
      {{results}}
    </div>
  </div>
</template>

<script>
  import axios from '../../axios-wrapper'
  import {serverAddress} from '../../env'

  export default {
    data() {
      return {
        query: {
          from: '',
          to: ''
        },
        results: []
      }
    },
    methods: {
      search() {
        if(this.query.from && this.query.to) {
          axios.get(`${serverAddress}/api/lifts/search`, {
            params: this.query
          }).then(response => {
            this.results = response.data
          }).catch(error => {
            console.error(error)
          })
        }
      }
    }
  }
</script>

<style lang="scss">

</style>
