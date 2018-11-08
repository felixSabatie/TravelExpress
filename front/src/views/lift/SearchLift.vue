<template>
  <div class="search">
    <div class="container">

      <h3 class="title">Quel trajet voulez-vous faire ?</h3>

      <div class="form">
        <form @submit.prevent="search()">
          <div class="row">
            <div class="col m6 s12 input-field-container">
              <div class="input-field">
                <i class="material-icons prefix">place</i>
                <input v-model.trim="query.from" id="departure_city" type="text" class="validate"
                       placeholder="Ville de départ" required>
              </div>
            </div>
            <div class="col m6 s12 input-field-container">
              <div class="input-field">
                <i class="material-icons prefix">flag</i>
                <input v-model.trim="query.to" id="arrival_city" type="text" class="validate"
                       placeholder="Ville d'arrivée" required>
              </div>
            </div>
          </div>
          <div class="row">
            <button class="btn right"><i class="material-icons left">search</i>Rechecher</button>
          </div>
        </form>
      </div>

      <div class="results" v-if="results && results.length > 0">
        <h3>Résultats</h3>
        {{results}}
      </div>
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
        if (this.query.from && this.query.to) {
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
  @import '../../styles/colors';

  .search {
    flex: 1;
    background: url(http://mediapa.co.nz/wp-content/uploads/2017/04/Happy-people-car-hire.jpg) center top;
    background-size: cover;

    .title {
      color: $white;
      text-align: center;
      font-weight: bold;
    }

    .form {
      .input-field-container {
        padding: 0 10px;

        .input-field {
          padding: 5px 5px;
          border-radius: 10px;
          background-color: $white;
        }
      }
    }

    .results {
      border-radius: 10px;
      background-color: $white;
      padding: 10px;

      h3 {
        margin-top: 0;
      }
    }
  }
</style>
