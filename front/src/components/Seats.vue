<template>
  <div class="seats">
    <div v-for="(seat, index) in capacity">
      <div v-if="nbPlacesLeft <= 0">
        <p>Complet</p>
      </div>
      <div v-else>
        <i v-if="index < capacity - nbPlacesLeft" class="material-icons unavailable-seat">person</i>
        <i v-else class="material-icons available-seat">person_outline</i>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: "Seats",
    props: ['nbPlacesLeft', 'capacity'],
  }
</script>

<style lang="scss">
  @import '../styles/colors';

  .seats {
    display: flex;
    flex-direction: row;
    justify-content: center;
  }

</style>
