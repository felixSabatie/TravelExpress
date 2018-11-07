<template>
  <div class="seats">
    <!--v-for seat in seatsAvailable-->
    <div class="availableSeats">
      <i class="material-icons prefix">airline_seat_legroom_normal</i>
      <i class="material-icons prefix">airline_seat_legroom_normal</i>
    </div>
    <!--v-for seat in seatsNotAvailable-->
    <div class="takenSeats">
      <i class="material-icons prefix">airline_seat_legroom_normal</i>
      <i class="material-icons prefix">airline_seat_legroom_normal</i>
    </div>
  </div>
</template>

<script>
  export default {
    name: "Seats"
  }
</script>

<style lang="scss">
  @import '../styles/colors';
  .takenSeats{
    color: #909999;
  }
</style>
