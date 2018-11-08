<template>
  <!--TODO : Ajouter les rules-->
  <div @click="showDetails" class="lift row section">
    <div class="departure col s4">
      <Location :city="lift.departure_city" :date="lift.departure_date"
                :address="lift.departure_address"></Location>
    </div>
    <div class="col s1">
      <i class="material-icons prefix">label_important</i>
    </div>
    <div class="arrival col s4">
      <Location :city="lift.arrival_city" :date="lift.arrival_date"
                :address="lift.arrival_address"></Location>
    </div>
    <div class="col s2">
      <div class="car">
        {{lift.car}}
      </div>
      <div class="seats">
        <Seats :capacity="lift.capacity" :nbPlacesLeft="nbPlacesLeft"></Seats>
      </div>
    </div>
    <div class="price col s1">
      ${{parseFloat(lift.price)}}
    </div>
  </div>
</template>

<script>
  import Location from "./Location";
  import Seats from "./Seats";

  export default {
    name: "Lift",
    components: {Seats, Location},
    props: ['lift'],
    computed: {
      nbPlacesLeft() {
        if (this.lift !== undefined) {
          let seatsTaken = this.lift.passengers.reduce(
              (total, passenger) => total + passenger.seats, 0)
          return this.lift.capacity - seatsTaken
        }
      },
    },
    methods:{
      showDetails(){
        this.$router.push({name: 'show_lift', params: {id: this.lift.id}})
      }
    }
  }
</script>

<style lang="scss">
  @import '../styles/colors';

  .lift {
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 0;
    cursor: pointer;

    &:hover {
      background-color: $light-grey;
    }
  }


</style>
