<template>
  <div class="listLifts">
      <div v-for="(lift,index) in lifts" :key="lift.id">
        <Lift :lift="lift"></Lift>
        <div v-if="index !== lifts.length-1" class="divider"></div>
      </div>
  </div>
</template>

<script>
  import Lift from "../../components/Lift";

  export default {
    name: "ListLifts",
    components: {Lift},
    props: ['lifts'],
  }

</script>

<style scoped>

</style>