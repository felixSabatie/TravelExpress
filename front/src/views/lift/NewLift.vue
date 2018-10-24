<template>
  <div class="new-lift">
    <h2>Publier un trajet</h2>
    <form>
      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">place</i>
          <input v-model="lift.departure_address" id="departure_address" type="text" class="validate" required>
          <label for="departure_address">Adresse de départ</label>
        </div>
      </div>

      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">flag</i>
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
          <i class="material-icons prefix">euro_symbol</i>
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
          <input id="arrival_date" type="text" class="datepicker" required>
          <label for="arrival_date">Arriver le...</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">watch_later</i>
          <input id="arrival_time" type="text" class="timepicker" required>
          <label for="arrival_time">à...</label>
        </div>
      </div>

      <button class="right btn" @click.prevent="sendForm">Valider</button>

    </form>
  </div>
</template>

<script>
  import M from 'materialize-css'

  export default {
    data: () => {
      return {
        lift: {
          departure_address: "",
          arrival_address: "",
          car: "",
          capacity: "",
          price: "",
          departure_date: {},
          departure_hours: {},
          departure_minutes: {},
          arrival_date: {},
          arrival_hours: {},
          arrival_minutes: {}
        }
      }
    },
    mounted() {
      M.updateTextFields()

      let that = this

      let departureDatepicker = document.querySelectorAll('.datepicker#departure_date');
      M.Datepicker.init(departureDatepicker, {
        format: 'dd/mm/yyyy',
        minDate: new Date(),
        onSelect: newDate => {that.lift.departure_date = newDate}
      });

      let arrivalDatepicker = document.querySelectorAll('.datepicker#arrival_date');
      M.Datepicker.init(arrivalDatepicker, {
        format: 'dd/mm/yyyy',
        minDate: new Date(),
        onSelect: newDate => {that.lift.arrival_date = newDate}
      });

      let departureTimePicker = document.querySelectorAll('.timepicker#departure_time');
      M.Timepicker.init(departureTimePicker, {
        twelveHour: false,
        onSelect: (newHours, newMinutes) => {
          that.lift.departure_hours = newHours
          that.lift.departure_minutes = newMinutes
        }
      });

      let arrivalTimePicker = document.querySelectorAll('.timepicker#arrival_time');
      M.Timepicker.init(arrivalTimePicker, {
        twelveHour: false,
        onSelect: (newHours, newMinutes) => {
          that.lift.arrival_hours = newHours
          that.lift.arrival_minutes = newMinutes
        }
      });
    },
    methods: {
      sendForm() {
        console.log(this.lift)
      }
    }
  }
</script>
