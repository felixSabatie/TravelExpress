<template>
  <div class="show-lift container">
    <div v-if="loading">
      <Loader />
    </div>
    <div v-else-if="lift !== undefined" class="lift-container">
      <h2 class="title">Trajet de {{lift.departure_city}} à {{lift.arrival_city}}</h2>
      <p class="info" v-if="currentUserIsDriver">Vous êtes le conducteur de ce trajet</p>
      <p class="info" v-if="currentUserIsPassenger">Vous avez réservé {{getNbSeatsReserved(currentUser.id)}} places sur ce trajet</p>
      <div class="infos">
        <div class="row">
          <div class="col m5 s12 label">
            Adresse de départ
          </div>
          <div class="col m7 s11 offset-s1 icon-text">
            <i class="material-icons prefix">place</i>
            <a :href="'https://www.google.com/maps/search/?api=1&query=' + lift.departure_city + ' ' + lift.departure_address"
            target="_blank">
              {{lift.departure_address}}, {{lift.departure_city}}
            </a>
          </div>
        </div>

        <div class="row">
          <div class="col m5 s12 label">
            Adresse d'arrivée
          </div>
          <div class="col m7 s11 offset-s1 icon-text">
            <i class="material-icons prefix">flag</i>
            <a :href="'https://www.google.com/maps/search/?api=1&query=' + lift.arrival_city + ' ' + lift.arrival_address"
               target="_blank">
              {{lift.arrival_address}}, {{lift.arrival_city}}
            </a>
          </div>
        </div>

        <div class="row">
          <div class="col m5 s12 label">
            Date de départ
          </div>
          <div class="col m7 s11 offset-s1 icon-text">
            <i class="material-icons prefix">date_range</i>
            <span>{{formatDate(lift.departure_date)}}</span>
          </div>
        </div>

        <div class="row">
          <div class="col m5 s12 label">
            Date d'arrivée
          </div>
          <div class="col m7 s11 offset-s1 icon-text">
            <i class="material-icons prefix">date_range</i>
            <span>{{formatDate(lift.arrival_date)}}</span>
          </div>
        </div>

        <div class="row">
          <div class="col m5 s12 label">
            Véhicule
          </div>
          <div class="col m7 s11 offset-s1 icon-text">
            <i class="material-icons prefix">directions_car</i>
            <span>{{lift.car}}</span>
          </div>
        </div>

        <div class="row">
          <div class="col m5 s12 label">
            {{nbPlacesLeft}} places restantes
          </div>
        </div>

        <div class="rules">
          <p v-for="rule in lift.rules" :key="rule.id">{{rule.name}}</p>
        </div>
      </div>

      <div class="driver">
        <p>Conducteur</p>
        <LiftAccount :account="lift.driver" @click="showAccount(lift.driver)"/>
      </div>

      <div class="reservation">
        <div class="price"><span class="price-text">Prix par place : </span><span class="price-number">${{lift.price}}</span></div>
        <div class="reservation-form" v-if="displayReservationForm">
          <div class="input-field select">
            <select v-model="seats">
              <option v-for="i in (1, nbPlacesLeft)" :value="i" :key="i">{{i}} place{{i > 1 ? 's' : ''}}</option>
            </select>
            <label>Nombre de places</label>
          </div>
          <button class="btn" @click="openModal">Réserver</button>
        </div>
      </div>

      <div class="passengers" v-if="lift.passengers.length > 0">
        <p>Passagers</p>
        <LiftAccount v-for="passenger in lift.passengers" :account="passenger.account"
                     :additional-info="'(' + getNbSeatsReserved(passenger.account_id) + ' places)'"
                     @click="showAccount(passenger.account)"
        />
      </div>
    </div>
    <div v-else>
      <Unfound />
    </div>

    <Modal v-if="showModal" class="modal" @close="showModal = false">
      <div slot="header">
        <h2>Réserver le trajet</h2>
      </div>
      <div slot="body">
        <div class="infos">
          <p class="price">{{lift.departure_city}} -> {{lift.arrival_city}}</p>
          <p class="price">{{seats}} place(s)</p>
          <p class="price">Total de la commande : ${{totalPrice}}</p>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <input id="card-name" type="text" class="validate" required>
            <label for="card-name">Nom sur la carte</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <input id="card-number" type="text" class="validate" required>
            <label for="card-number">Numéro de carte</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s8">
            <input id="expiration-date" type="text" class="validate" required>
            <label for="expiration-date">Date d'expiration</label>
          </div>
          <div class="input-field col s4">
            <input id="security-code" type="text" class="validate" required>
            <label for="security-code">Sécurité</label>
          </div>
        </div>
      </div>
      <div slot="footer">
        <button class="btn right" @click="sendReservation">Valider la réservation</button>
      </div>
    </Modal>

    <Modal v-if="showAccountModal" class="modal account-modal" @close="showAccountModal = false">
      <div slot="header">
        <h2>{{shownAccount.first_name}} {{shownAccount.last_name}}</h2>
      </div>
      <div slot="body">
        <div class="account-infos">
          <div class="row">
            <div class="col m6 s12 label">Email : </div>
            <div class="col m6 s11 offset-s1 value"><a :href="'mailto:' + shownAccount.email">{{shownAccount.email}}</a></div>
          </div>
          <div class="row" v-if="shownAccount.phone">
            <div class="col m6 s12 label">Numéro de téléphone : </div>
            <div class="col m6 s11 offset-s1 value"><a :href="'tel:' + shownAccount.phone">{{shownAccount.phone}}</a></div>
          </div>
        </div>
      </div>
    </Modal>
  </div>
</template>

<script>
  import axios from '../../axios-wrapper'
  import {serverAddress} from '../../env'
  import Unfound from '../Unfound'
  import Loader from '../Loader'
  import moment from 'moment'
  import M from 'materialize-css'
  import Modal from '../Modal'
  import {mapGetters} from 'vuex'
  import LiftAccount from '../../components/LiftAccount'

  export default {
    components: { Unfound, Loader, Modal, LiftAccount },
    data() {
      return {
        lift: undefined,
        loading: true,
        seats: 1,
        totalPrice: undefined,
        showModal: false,
        paymentDone: false,
        showAccountModal: false,
        shownAccount: undefined
      }
    },
    computed: {
      nbPlacesLeft() {
        if(this.lift !== undefined) {
          let seatsTaken = this.lift.passengers.reduce((total, passenger) => total + passenger.seats, 0)
          return this.lift.capacity - seatsTaken
        }
      },
      currentUserIsDriver() {
        return this.currentUser.id === this.lift.driver.id
      },
      currentUserIsPassenger() {
        return this.lift.passengers.some(passenger => {
          return passenger.account_id === this.currentUser.id
        })
      },
      displayReservationForm() {
        return !this.currentUserIsDriver && !this.currentUserIsPassenger
      },
      ...mapGetters({currentUser: 'account'})
    },
    mounted() {
      let liftId = Number(this.$route.params.id)
      if(!isNaN(liftId)) {
        axios.get(`${serverAddress}/api/lifts/${liftId}`).then(response => {
          this.lift = {
            ...response.data,
            price: parseFloat(response.data.price)
          }
          this.loading = false
          this.$nextTick(() => {
            this.initSelect()
          })
        }).catch(error => {
          console.error(error)
          this.loading = false
        })
      } else {
        this.loading = false
      }
    },
    methods: {
      formatDate(date) {
        return moment(date).format('[Le ]DD/MM/YYYY[, à ]HH[h]mm')
      },
      initSelect() {
        let elems = document.querySelectorAll('select');
        M.FormSelect.init(elems);
      },
      openModal() {
        this.totalPrice = this.seats * this.lift.price
        this.showModal = true
      },
      sendReservation() {
        axios.post(`${serverAddress}/api/lifts/${this.lift.id}/reservations`, {
          seats: this.seats
        }).then(response => {
          this.lift = response.data
          this.showModal = false
          M.toast({html: 'Votre réservation a bien été effectuée'})
        }).catch(err => {
          console.error(err)
        })
      },
      getNbSeatsReserved(accountId) {
        return this.lift.passengers.find(passenger => passenger.account_id === accountId).seats
      },
      showAccount(account) {
        console.log(account)
        this.shownAccount = account
        this.showAccountModal = true
      }
    }
  }
</script>

<style lang="scss">
  @import '../../styles/colors';

  .lift-container {
    padding-bottom: 20px;

    .title {
      text-align: center;
    }

    .info {
      text-align: center;
    }

    .label {
      color: $grey-text-color;
      font-weight: bold;
      text-align: right;

      @media screen and (max-width: 601px) {
        text-align: left;
      }
    }
    .icon-text {
      display: flex;
      align-items: center;
      span {
        margin-left: 10px;
      }
    }

    .rules {
      text-align: center;
      font-weight: bold;
      color: $accent-color;
    }

    .reservation {
      max-width: 500px;
      margin: 20px auto;
      background-color: $light-grey;
      padding: 20px;
      border-radius: 5px;

      .price {
        display: flex;
        align-items: center;
        justify-content: center;

        .price-text {
          font-weight: bold;
          margin-right: 5px;
        }
        .price-number {
          font-size: 20px;
          color: $accent-color;
          font-weight: bold;
        }
      }

      .reservation-form {
        display: flex;
        align-items: center;

        .select {
          padding-right: 10px;
          flex: 1;
        }
      }
    }

    .driver, .passengers {
      max-width: 500px;
      margin: 5px auto;
    }
  }

  .modal {
    .infos {
      text-align: center;
      .price {
        font-weight: bold;
      }
    }
    .accepted-payment {
      display: flex;
      align-items: center;
      & > *:first-child {
        margin-right: 5px;
      }
    }
  }

  .account-modal {
    .account-infos {
      text-align: left;

      .label {
        font-weight: bold;

        @media only screen and (min-width: 601px) {
          text-align: right;
        }
      }
    }
  }

</style>
