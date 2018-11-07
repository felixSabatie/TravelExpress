<template>
  <div class="listLifts">
    <div class="container">
      <!--v-for "item in items"-->
      <div class="section">
        <Lift></Lift>
      </div>

      <div class="divider"></div>

      <div class="section">
        <Lift></Lift>
      </div>

      <div class="divider"></div>

      <div class="section">
        <Lift></Lift>
      </div>
    </div>
  </div>
</template>

<script>
  import Lift from "../../components/Lift";

  export default {
    name: "ListLifts",
    components: {Lift}
  }
</script>

<style scoped>

</style>