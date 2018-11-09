<template>
  <!--TODO : Ajouter les rules-->
  <div @click="showDetails" class="lift row section">

    <div class="locations col m9 s12">
      <div class="location">
        <Location :city="lift.departure_city" :date="lift.departure_date"
                  :address="lift.departure_address"></Location>
      </div>
      <div class="arrow">
        <i class="material-icons prefix">label_important</i>
      </div>
      <div class="location">
        <Location :city="lift.arrival_city" :date="lift.arrival_date"
                  :address="lift.arrival_address"></Location>
      </div>
    </div>

    <div class="infos col m3 s12">
      <div class="car-infos">
        <div class="car">
          {{lift.car}}
        </div>
        <Seats :capacity="lift.capacity" :nbPlacesLeft="nbPlacesLeft"></Seats>
      </div>
      <div class="price">
        ${{parseFloat(lift.price)}}
      </div>
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
    margin: 0;
    cursor: pointer;

    &:hover {
      background-color: $light-grey;
    }

    .infos, .locations {
      display: flex;
      flex-direction: row;
      align-items: center;
    }

    .locations {
      .location {
        flex: 4;
      }

      .arrow {
        flex: 1;
        text-align: center;
      }
    }

    .infos {

      @media only screen and (max-width: 601px) {
        margin-top: 20px;
      }
      .car-infos {
        flex: 1;
        text-align: center;
      }
      .price {
        flex: 1;
        text-align: center;
      }
    }
  }


</style>
