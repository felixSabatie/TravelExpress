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
          <div class="row buttons">
            <button class="btn right"><i class="material-icons left">search</i>Rechecher</button>
            <button @click.prevent="getLifts()" class="btn right"><i class="material-icons left">list</i>Tous
              les trajets
            </button>
          </div>
        </form>
      </div>

      <div class="results" v-if="userSearched">
        <h3>Résultats</h3>
        <ListLifts v-if="results && results.length > 0" :lifts="results"></ListLifts>
        <p v-else>
          0 résultats correspondants à la recherche
        </p>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from '../../axios-wrapper'
  import {serverAddress} from '../../env'
  import ListLifts from "./ListLifts";

  export default {
    components: {ListLifts},
    data() {
      return {
        query: {
          from: '',
          to: ''
        },
        results: [],
        userSearched: false,
      }
    },
    mounted() {
      this.query.from = this.$route.query.from
      this.query.to = this.$route.query.to
      if(this.query.from && this.query.to) {
        this.search()
      }
    },
    methods: {
      search() {
        this.userSearched = true
        if (this.query.from && this.query.to) {
          this.$router.push({name: 'search', query: {from: this.query.from, to: this.query.to}})

          axios.get(`${serverAddress}/api/lifts/search`, {
            params: this.query
          }).then(response => {
            this.results = response.data
          }).catch(error => {
            console.error(error)
          })
        }
      },
      getLifts() {
        this.userSearched = true
        axios.get(`${serverAddress}/api/lifts/`)
        .then(response => {
          this.results = response.data;
        }).catch(error => {
          console.error(error)//TODO : handle error
        });
      },
    }
  }
</script>

<style lang="scss">
  @import '../../styles/colors';

  .search {
    flex: 1;
    background: url(/images/background.jpg) center top;
    background-size: cover;
    padding-bottom: 20px;

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

      .buttons {
        .btn {
          margin-left: 10px;
        }

        @media only screen and (max-width: 601px) {
          :not(:last-child) {
            margin-bottom: 10px;
          }
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
