<template>
  <div class="seats">
    <div v-for="(seat,index) in capacity" in seatsAvailable>
      <i v-if="index < nbPlacesLeft" class="material-icons prefix availableSeat">airline_seat_legroom_normal</i>
      <i v-else class="material-icons prefix unavailableSeat">airline_seat_legroom_normal</i>
    </div>
  </div>
</template>

<script>
  export default {
    name: "Seats",
    props : {
      nbPlacesLeft: "",
      capacity: "",
    }
  }
</script>

<style lang="scss">
  @import '../styles/colors';

  .seats{
    display: flex;
    flex-direction: row;
  }

  .unavailableSeats{
    color: #909999;
  }
</style>
