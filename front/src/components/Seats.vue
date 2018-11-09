<template>
  <div class="seats">
    <div v-for="(seat, index) in capacity">
      <i v-if="index < nbPlacesLeft" class="material-icons available-seat">airline_seat_legroom_normal</i>
      <i v-else class="material-icons unavailable-seat">airline_seat_legroom_normal</i>
    </div>
  </div>
</template>

<script>
  export default {
    name: "Seats",
    props : ['nbPlacesLeft', 'capacity']
  }
</script>

<style lang="scss">
  @import '../styles/colors';

  .seats{
    display: flex;
    flex-direction: row;
    justify-content: center;
  }

  .unavailable-seat{
    color: #909999;
  }
</style>
