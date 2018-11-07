<template>
  <div class="lift row">
    <div class="departure col s4">
      <Location></Location>
    </div>
    <div class="col s1">
      <i class="material-icons prefix">label_important</i>
    </div>
    <div class="arrival col s4">
      <Location></Location>
    </div>
    <div class="col s2">
      <div class="car">
        Jeep Liberty
      </div>
      <div class="seats">
        <Seats></Seats>
      </div>
    </div>
    <div class="price col s1">
      25$
    </div>
  </div>
</template>

<script>
  import Location from "./Location";
  import Seats from "./Seats";

  export default {
    name: "Lift",
    components: {Seats, Location}
  }
</script>

<style scoped>

</style>