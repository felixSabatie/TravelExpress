<template>
  <div class="new-lift">
    <h2>Publier un trajet</h2>
    <div class="form">
      <div class="input-field">
        <input id="departure_address" type="text" class="validate">
        <label for="departure_address">Adresse de départ</label>
      </div>

      <div class="input-field">
        <input id="arrival_address" type="text" class="validate">
        <label for="arrival_address">Adresse d'arrivée</label>
      </div>

      <div class="input-field">
        <input id="car" type="text" class="validate">
        <label for="car">Modèle de voiture</label>
      </div>

      <div class="input-field">
        <input id="price" type="number" min="0" class="validate">
        <label for="price">Prix demandé par personne</label>
      </div>

      <div class="input-field">
        <input id="capacity" type="number" min="0" class="validate">
        <label for="capacity">Nombre de personnes</label>
      </div>
      <div class="row">
        <div class="input-field col s6">
          <input id="departure_date" type="text" class="datepicker">
          <label for="departure_date">Partir le...</label>
        </div>
        <div class="input-field col s6">
          <input id="departure_time" type="text" class="timepicker">
          <label for="departure_time">à...</label>
        </div>
      </div>

      <div class="input-field">
        <input id="arrival_time" type="text" class="timepicker">
        <label for="arrival_time">Arriver à...</label>
      </div>
    </div>
  </div>
</template>

<script>
  import M from 'materialize-css'

  export default {
    mounted: () => {
      M.updateTextFields()
      let datepickers = document.querySelectorAll('.datepicker');
      M.Datepicker.init(datepickers, {format: 'dd/mm/yyyy', minDate: new Date()});
      let timepickers = document.querySelectorAll('.timepicker');
      M.Timepicker.init(timepickers, {twelveHour: false});
    }
  }
</script>
