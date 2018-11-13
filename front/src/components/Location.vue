<template>
  <div class="location">
    <div class="city">
      {{city}}
    </div>
    <div class="date">
      {{formatDate(date)}}
    </div>
    <div class="address">
      {{address}}
    </div>
  </div>
</template>

<script>
  import moment from 'moment'
  export default {
    name: "Location",
    props : {
      city: "",
      date: "",
      address: "",
    },
    methods:{
      formatDate(date) {
        return moment(date).format('[Le ]DD/MM/YYYY[, à ]HH[h]mm')
      },
    }
  }
</script>

<style lang="scss">
  @import '../styles/colors';

  .location{
    text-align : center;
  }

  .city{
    font-weight: bold;
  }


</style>
