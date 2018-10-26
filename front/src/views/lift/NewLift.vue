<template>
  <div class="new-lift">
    <h2>Publier un trajet</h2>
    <form @submit.prevent="sendForm">
      <div class="row">
        <div class="input-field col m4 s12">
          <i class="material-icons prefix">place</i>
          <input v-model="lift.departure_city" id="departure_city" type="text" class="validate" required>
          <label for="departure_city">Ville de départ</label>
        </div>
        <div class="input-field col m8 s12">
          <input v-model="lift.departure_address" id="departure_address" type="text" class="validate" required>
          <label for="departure_address">Adresse de départ</label>
        </div>
      </div>

      <div class="row">
        <div class="input-field col m4 s12">
          <i class="material-icons prefix">flag</i>
          <input v-model="lift.arrival_city" id="arrival_city" type="text" class="validate" required>
          <label for="arrival_city">Ville d'arrivée</label>
        </div>
        <div class="input-field col m8 s12">
          <input v-model="lift.arrival_address" id="arrival_address" type="text" class="validate" required>
          <label for="arrival_address">Adresse d'arrivée</label>
        </div>
      </div>

      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">directions_car</i>
          <input v-model="lift.car" id="car" type="text" class="validate" required>
          <label for="car">Modèle de voiture</label>
        </div>
      </div>

      <div class="row">
        <div  class="input-field col m6 s12">
          <i class="material-icons prefix">face</i>
          <input v-model.number="lift.capacity" id="capacity" type="number" min="0" class="validate" required>
          <label for="capacity">Nombre de personnes</label>
        </div>
        <div class="input-field col m6 s12">
          <i class="material-icons prefix">attach_money</i>
          <input v-model.number="lift.price" id="price" type="number" min="0" class="validate" step="0.01" required>
          <label for="price">Prix demandé par personne</label>
        </div>
      </div>

      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">date_range</i>
          <input id="departure_date" type="text" class="datepicker" required>
          <label for="departure_date">Partir le...</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">watch_later</i>
          <input id="departure_time" type="text" class="timepicker" required>
          <label for="departure_time">à...</label>
        </div>
      </div>

      <div class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">date_range</i>
          <input id="arrival_date" type="text" class="datepicker" required :disabled="!departureIsValid">
          <label for="arrival_date">Arriver le...</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">watch_later</i>
          <input id="arrival_time" type="text" class="timepicker" required :disabled="!departureIsValid">
          <label for="arrival_time">à...</label>
        </div>
      </div>

      <button class="right btn">Valider</button>

    </form>
  </div>
</template>

<script>
  import M from 'materialize-css'
  import axios from 'axios'
  import {serverAddress} from '../../env'

  export default {
    data: () => {
      return {
        lift: {
          departure_address: "",
          arrival_address: "",
          departure_city: "",
          arrival_city: "",
          car: "",
          capacity: "",
          price: "",
          departure_date: undefined,
          departure_hours: undefined,
          departure_minutes: undefined,
          arrival_date: undefined,
          arrival_hours: undefined,
          arrival_minutes: undefined,
          rules: []
        },
        rules: []
      }
    },
    computed: {
      departureIsValid() {
        return this.lift.departure_date !== undefined
            && this.lift.departure_hours !== undefined
            && this.lift.departure_minutes !== undefined
      }
    },
    watch: {
      departureIsValid(newValidity, oldValidity) {
        if(newValidity)
          this.initArrivalDatePicker()
      }
    },
    mounted() {
      this.initMaterializeStuff()

      axios.get(`${serverAddress}/api/rules`).then(response => {
        this.rules = response.data
      })
    },
    methods: {
      initMaterializeStuff() {
        M.updateTextFields()

        let departureDatepicker = document.querySelectorAll('.datepicker#departure_date');
        M.Datepicker.init(departureDatepicker, {
          format: 'dd/mm/yyyy',
          minDate: new Date(),
          onSelect: this.updateDepartureDate
        });

        let departureTimePicker = document.querySelectorAll('.timepicker#departure_time');
        M.Timepicker.init(departureTimePicker, {
          twelveHour: false,
          onSelect: this.updateDepartureTime
        });

        let arrivalTimePicker = document.querySelectorAll('.timepicker#arrival_time');
        M.Timepicker.init(arrivalTimePicker, {
          twelveHour: false,
          onSelect: this.updateArrivalTime
        });
      },
      sendForm() {
        this.lift.departure_date.setHours(this.lift.departure_hours)
        this.lift.departure_date.setMinutes(this.lift.departure_minutes)
        this.lift.arrival_date.setHours(this.lift.arrival_hours)
        this.lift.arrival_date.setMinutes(this.lift.arrival_minutes)
        axios.post(`${serverAddress}/api/lifts`, this.lift).then(data => {
          console.log(data)
        }).catch(error => {
          console.error(error)
        })
      },
      updateDepartureDate(newDate) {
        this.lift.departure_date = newDate
      },
      updateArrivalDate(newDate) {
        this.lift.arrival_date = newDate
      },
      updateDepartureTime(newHours, newMinutes) {
        this.lift.departure_hours = newHours
        this.lift.departure_minutes = newMinutes
      },
      updateArrivalTime(newHours, newMinutes) {
        this.lift.arrival_hours = newHours
        this.lift.arrival_minutes = newMinutes
      },
      initArrivalDatePicker() {
        let arrivalDatepicker = document.querySelectorAll('.datepicker#arrival_date');
        M.Datepicker.init(arrivalDatepicker, {
          format: 'dd/mm/yyyy',
          minDate: this.lift.departure_date,
          onSelect: this.updateArrivalDate
        });
      }
    }
  }
</script>
