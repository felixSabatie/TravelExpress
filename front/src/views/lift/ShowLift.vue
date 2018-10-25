<template>
  <div class="show-lift">
    <div v-if="loading">
      <Loader />
    </div>
    <div v-else-if="lift !== undefined" class="lift-container">
      <h2>Trajet de {{lift.departure_city}} à {{lift.arrival_city}}</h2>
      <div class="infos">
        <div class="row">
          <div class="col m3 s12 label">
            Adresse de départ
          </div>
          <div class="col m9 s11 offset-s1 icon-text">
            <i class="material-icons prefix">place</i>
            <span>{{lift.departure_address}}, {{lift.departure_city}}</span>
          </div>
        </div>

        <div class="row">
          <div class="col m3 s12 label">
            Adresse d'arrivée
          </div>
          <div class="col m9 s11 offset-s1 icon-text">
            <i class="material-icons prefix">flag</i>
            <span>{{lift.arrival_address}}, {{lift.arrival_city}}</span>
          </div>
        </div>

        <div class="row">
          <div class="col m3 s12 label">
            Date de départ
          </div>
          <div class="col m9 s11 offset-s1 icon-text">
            <i class="material-icons prefix">date_range</i>
            <span>{{formatDate(lift.departure_date)}}</span>
          </div>
        </div>

        <div class="row">
          <div class="col m3 s12 label">
            Date d'arrivée
          </div>
          <div class="col m9 s11 offset-s1 icon-text">
            <i class="material-icons prefix">date_range</i>
            <span>{{formatDate(lift.arrival_date)}}</span>
          </div>
        </div>

        <div class="row">
          <div class="col m3 s12 label">
            Véhicule
          </div>
          <div class="col m9 s11 offset-s1 icon-text">
            <i class="material-icons prefix">directions_car</i>
            <span>{{lift.car}}</span>
          </div>
        </div>

        <div class="row">
          <div class="col s12 label">
            {{nbPlacesLeft}} places restantes
          </div>
        </div>
      </div>
      <div class="reservation">
        <div class="price">Prix par place : <span class="price-number">${{lift.price}}</span></div>
        <div class="input-field">
          <select v-model="nbPlaces">
            <option v-for="i in (1, nbPlacesLeft)" :value="i">{{i}} place{{i > 1 ? 's' : ''}}</option>
          </select>
          <label>Nombre de places</label>
        </div>
        <button class="btn">Réserver</button>
      </div>
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
  import moment from 'moment'
  import M from 'materialize-css'

  export default {
    data() {
      return {
        lift: undefined,
        loading: true,
        nbPlaces: 1
      }
    },
    computed: {
      nbPlacesLeft() {
        if(this.lift !== undefined)
          return this.lift.capacity - this.lift.passengers.length
      }
    },
    components: { Unfound, Loader },
    mounted() {
      let liftId = Number(this.$route.params.id)
      if(!isNaN(liftId)) {
        axios.get(`${serverAddress}/api/lifts/${liftId}`).then(response => {
          this.lift = {
            ...response.data,
            price: parseFloat(response.data.price)
          }
          this.loading = false
          this.$nextTick(() => {
            this.initSelect()
          })
        }).catch(error => {
          this.loading = false
        })
      } else {
        this.loading = false
      }
    },
    methods: {
      formatDate(date) {
        return moment(date).format('[Le ]DD/MM/YYYY[, à ]HH[h]mm')
      },
      initSelect() {
        let elems = document.querySelectorAll('select');
        M.FormSelect.init(elems);
      }
    }
  }
</script>

<style lang="scss">
  @import '../../styles/colors';

  .lift-container {
    .label {
      color: $grey-text-color;
      font-weight: bold;
    }
    .icon-text {
      display: flex;
      align-items: center;
      span {
        margin-left: 10px;
      }
    }
  }
</style>
